(function(a){"use strict",a(jQuery,window,document)})(function(a,b,c,d){"use strict",a.widget("selectBox.selectBoxIt",{version:"0.9.0",options:{showEffect:"none",showEffectOptions:{},showEffectSpeed:"medium",hideEffect:"none",hideEffectOptions:{},hideEffectSpeed:"medium",showFirstOption:!0,defaultText:"",defaultIcon:"",downArrowIcon:""},_create:function(){this.originalElem=this.element[0],this.selectBox=this.element,this.selectItems=this.element.find("option"),this.firstSelectItem=this.element.find("option").slice(0,1),this.currentFocus=0,this.blur=!0,this.documentHeight=a(c).height(),this.textArray=[],this.currentIndex=0,this.flipped=!1,this._createDiv(),this._createUnorderedList(),this._replaceSelectBox(),this._eventHandlers(),this.originalElem.disabled&&this.disable&&this.disable(),this._ariaAccessibility&&this._ariaAccessibility(),this._addClasses(),this._jqueryui&&this._jqueryui(),this.selectBox.trigger("create")},_createDiv:function(){return this.divText=a("<span/>",{id:this.originalElem.id+"SelectBoxItText","class":"selectboxit-text",unselectable:"on",text:this.firstSelectItem.text()}).attr("data-val",this.originalElem.value),this.divImage=a("<span/>",{id:this.originalElem.id+"SelectBoxItDefaultIcon","class":"selectboxit-default-icon",unselectable:"on"}),this.div=a("<div/>",{id:this.originalElem.id+"SelectBoxIt","class":"selectboxit",name:this.originalElem.name,tabindex:0,unselectable:"on"}).append(this.divImage).append(this.divText),this.divContainer=a("<div/>",{id:this.originalElem.id+"SelectBoxItContainer","class":"selectboxit-container"}).append(this.div),this},_createUnorderedList:function(){var b=this,c,d="",e="",f,g="",h=a("<ul/>",{id:this.originalElem.id+"SelectBoxItOptions","class":"selectboxit-options",tabindex:-1});return this.options.showFirstOption||(this.selectItems=this.selectBox.find("option").slice(1)),this.selectItems.each(function(h){c=a(this).prop("disabled"),f=a(this).data("icon")||"",a(this).parent().is("optgroup")?(d="selectboxit-optgroup-option",a(this).index()===0?e='<div class="selectboxit-optgroup-header" data-disabled="true">'+a(this).parent().first().attr("label")+"</div>":e=""):d="",g+=e+'<li id="'+h+'" data-val="'+this.value+'" data-disabled="'+c+'" class="'+d+'"><span class="'+f+'"></span>'+a(this).text()+"</li>",b.textArray[h]=a(this).text(),this.selected&&(b.divText.text(a(this).text()),b.currentFocus=h)}),b.options.defaultText&&b.divText.text(b.options.defaultText),b.selectBox.data("text")&&(b.divText.text(b.selectBox.data("text")),b.options.defaultText=b.selectBox.data("text")),h.append(g),this.list=h,this.divContainer.append(this.list),this.listItems=this.list.find("li"),this.list.find("li[data-disabled='true']").not(".optgroupHeader").addClass("ui-state-disabled"),this.currentFocus===0&&!this.options.showFirstOption&&this.listItems.eq(0).hasClass("ui-state-disabled")&&(this.currentFocus=+this.listItems.not(".ui-state-disabled").first().attr("id")),this.divImage.addClass(this.selectBox.data("icon")||this.options.defaultIcon||this.listItems.eq(this.currentFocus).find("span").attr("class")),this},_replaceSelectBox:function(){this.selectBox.css("display","none").after(this.divContainer);var b=this.div.height();return this.downArrow=a("<span/>",{id:this.originalElem.id+"SelectBoxItArrow","class":"selectboxit-arrow",unselectable:"on"}),this.downArrowContainer=a("<span/>",{id:this.originalElem.id+"SelectBoxItArrowContainer","class":"selectboxit-arrow-container",unselectable:"on",style:"height:"+b+"px;"}).append(this.downArrow),this.div.append(this.downArrowContainer),this.divText.css({"line-height":this.div.css("height"),"max-width":this.div.width()-(this.downArrowContainer.width()+this.divImage.width())-5}),this.divImage.css({"margin-top":b/4}),this.listItems.find("span").css({"margin-top":b/4}),this},_scrollToView:function(a){var b=this.list.scrollTop(),c=this.listItems.eq(this.currentFocus).height(),d=this.listItems.eq(this.currentFocus).position().top,e=this.list.height();return a==="search"?e-d<c?this.list.scrollTop(b+(d-(e-c))):d<-1&&this.list.scrollTop(d-c):a==="up"?d<-1&&this.list.scrollTop(b-Math.abs(this.listItems.eq(this.currentFocus).position().top)):a==="down"&&e-d<c&&this.list.scrollTop(b+(Math.abs(this.listItems.eq(this.currentFocus).position().top)-e+c)),this},_callbackSupport:function(b){a.isFunction(b)&&b.call(this.element.data(this.widgetName),this.div)},open:function(a){if(!this.list.is(":visible")){var b=this;this.selectBox.trigger("open"),this._dynamicPositioning&&this._dynamicPositioning();switch(this.options.showEffect){case"none":this.list.show(),this._scrollToView("search");break;case"show":this.list.show(this.options.showEffectSpeed,function(){b._scrollToView("search")});break;case"slideDown":this.list.slideDown(this.options.showEffectSpeed,function(){b._scrollToView("search")});break;case"fadeIn":this.list.fadeIn(this.options.showEffectSpeed),this._scrollToView("search");break;default:this.list.show(this.options.showEffect,this.options.showEffectOptions,this.options.showEffectSpeed,function(){b._scrollToView("search")})}}return this._callbackSupport(a),this},close:function(a){if(this.list.is(":visible")){var b=this;this.selectBox.trigger("close");switch(this.options.hideEffect){case"none":this.list.hide(),this._scrollToView("search");break;case"hide":this.list.hide(this.options.hideEffectSpeed);break;case"slideUp":this.list.slideUp(this.options.hideEffectSpeed);break;case"fadeOut":this.list.fadeOut(this.options.hideEffectSpeed);break;default:this.list.hide(this.options.hideEffect,this.options.hideEffectOptions,this.options.hideEffectSpeed,function(){b._scrollToView("search")})}}return this._callbackSupport(a),this},_eventHandlers:function(){var b=this,c=38,d=40,e=13,f=8,g=9,h=32,i=27;return this.div.bind({"click.selectBoxIt":function(){b.div.is(":focus")||a(this).focus(),b.originalElem.disabled||(b.selectBox.trigger("click"),b.list.is(":visible")?b.close():b.open())},"mousedown.selectBoxIt":function(){a(this).data("mdown",!0)},"blur.selectBoxIt":function(){b.blur&&(b.selectBox.trigger("blur").trigger("focusout"),b.list.is(":visible")&&b.close())},"focus.selectBoxIt":function(){var c=a(this).data("mdown");a(this).removeData("mdown"),c||b.selectBox.trigger("tab-focus"),b.list.is(":visible")||b.selectBox.trigger("focus").trigger("focusin")},"keydown.selectBoxIt":function(a){var h=a.keyCode;if(b.div.is(":focus"))switch(h){case d:a.preventDefault(),b.moveDown&&b.moveDown();break;case c:a.preventDefault(),b.moveUp&&b.moveUp();break;case e:a.preventDefault(),b.list.is(":visible")&&b.close(),(!b.options.showFirstOption&&b.div.text()===b.firstSelectItem.text()&&b.currentFocus===0||b.options.showFirstOption&&b.options.defaultText||!b.options.showFirstOption&&!b.listItems.eq(0).not("[data-disabled='true']"))&&b.selectBox.val(b.listItems.eq(b.currentFocus).attr("data-val")).trigger("change"),b.selectBox.trigger("enter");break;case g:b.selectBox.trigger("tab-blur");break;case f:a.preventDefault(),b.selectBox.trigger("backspace");break;case i:b.close();break;default:}},"keypress.selectBoxIt":function(a){if(b.div.is(":focus")){var c=a.charCode||a.keyCode,d=String.fromCharCode(c);c===h&&a.preventDefault(),b.search&&b.search(d,!0,"")}},"mouseenter.selectBoxIt":function(){b.selectBox.trigger("mouseenter")},"mouseleave.selectBoxIt":function(){b.selectBox.trigger("mouseleave")}}),this.list.bind({"mouseover.selectBoxIt":function(){b.blur=!1},"mouseout.selectBoxIt":function(){b.blur=!0},"focusin.selectBoxIt":function(){b.div.focus()}}).delegate("li","click.selectBoxIt",function(){a(this).data("disabled")||(b.originalElem.value=a(this).attr("data-val"),b.currentFocus=+this.id,b.close(),b.originalElem.value!==b.divText.attr("data-val")&&b.selectBox.trigger("change"),b.selectBox.trigger("option-click"))}).delegate("li","focus.selectBoxIt",function(){a(this).data("disabled")||(b.originalElem.value=a(this).attr("data-val"),b.originalElem.value!==b.divText.attr("data-val")&&b.selectBox.trigger("change"))}),this.selectBox.bind({"change.selectBoxIt":function(){b.divText.text(b.listItems.eq(b.currentFocus).text()).attr("data-val",b.originalElem.value),b.listItems.eq(b.currentFocus).find("span").attr("class")&&b.divImage.attr("class",b.listItems.eq(b.currentFocus).find("span").attr("class")).addClass("selectboxit-default-icon")},"disable.selectBoxIt":function(){b.div.addClass("ui-state-disabled")},"enable.selectBoxIt":function(){b.div.removeClass("ui-state-disabled")}}),this},_addClasses:function(){var b=this,c="selectboxit-focus",d="selectboxit-hover";return this.downArrow.addClass(this.selectBox.data("downarrow")||this.options.downArrowIcon||""),this.div.addClass("selectboxit-widget"),this.list.addClass("selectboxit-widget selectboxit-widget-content"),this.listItems.bind({"focus.selectBoxIt":function(){a(this).addClass(c)},"blur.selectBoxIt":function(){a(this).removeClass(c)}}),this.selectBox.bind({"open.selectBoxIt":function(){b.div.removeClass(d).add(b.listItems.eq(b.currentFocus)).addClass(c)},"blur.selectBoxIt":function(){b.div.removeClass(c)},"mouseenter.selectBoxIt":function(){b.div.addClass(d)},"mouseleave.selectBoxIt":function(){b.div.removeClass(d)}}),this.listItems.bind({"mouseenter.selectBoxIt":function(){b.listItems.removeClass(c),a(this).addClass(d)},"mouseleave.selectBoxIt":function(){a(this).removeClass(d)}}),this}})});
$(function(){$.selectBox.selectBoxIt.prototype._ariaAccessibility=function(){var a=this;return this.div.attr({role:"combobox","aria-autocomplete":"list","aria-expanded":"false","aria-owns":this.list.attr("id"),"aria-activedescendant":this.listItems.eq(this.currentFocus).attr("id"),"aria-label":$("label[for='"+this.originalElem.id+"']").text()||"","aria-live":"assertive"}).bind({"disable.selectBoxIt":function(){a.div.attr("aria-disabled","true")},"enable.selectBoxIt":function(){a.div.attr("aria-disabled","false")}}),a.list.attr({role:"listbox","aria-hidden":"true"}),a.listItems.attr({role:"option"}),a.selectBox.bind({"change.selectBoxIt":function(){a.divText.attr("aria-label",a.originalElem.value)},"open.selectBoxIt":function(){a.list.attr("aria-hidden","false"),a.div.attr("aria-expanded","true")},"close.selectBoxIt":function(){a.list.attr("aria-hidden","true"),a.div.attr("aria-expanded","false")}}),this}});
$(function(){$.selectBox.selectBoxIt.prototype.destroy=function(a){return this.div.unbind(".selectBoxIt").undelegate(".selectBoxIt"),this.divContainer.remove(),this.selectBox.trigger("destroy").show(),$.Widget.prototype.destroy.call(this),this._callbackSupport(a),this}});
$(function(){$.selectBox.selectBoxIt.prototype.disable=function(a){if(!this.options.disabled)return this.close(),this.selectBox.trigger("disable").attr("disabled","disabled"),this.div.removeAttr("tabindex").css("cursor","default"),$.Widget.prototype.disable.call(this),this._callbackSupport(a),this},$.selectBox.selectBoxIt.prototype._isDisabled=function(a){return this.originalElem.disabled&&this.disable(),this}});
$(function(){$.selectBox.selectBoxIt.prototype._dynamicPositioning=function(){var a=this.div.offset().top,b=this.list.height(),c=this.div.height();a+c+b>=$(window).height()+$(window).scrollTop()&&a-b>=0?this.flipped||(this.list.css("top",this.divContainer.position().top-this.list.height()-2),this.flipped=!0):this.flipped&&(this.list.css("top",this.divContainer.position().top+this.div.height()+2),this.flipped=!1)}});
$(function(){$.selectBox.selectBoxIt.prototype.enable=function(a){return this.options.disabled&&(this.selectBox.trigger("enable").removeAttr("disabled"),this.div.attr("tabindex",0).css("cursor","pointer"),$.Widget.prototype.enable.call(this),this._callbackSupport(a)),this}});
$(function(){$.selectBox.selectBoxIt.prototype._jqueryui=function(){var a=this,b="ui-state-focus",c="ui-state-hover";return this.downArrow.addClass(this.selectBox.data("downarrow")||this.options.downArrowIcon||"ui-icon ui-icon-triangle-1-s"),this.div.addClass("ui-widget ui-state-default"),this.list.addClass("ui-widget ui-widget-content"),this.listItems.bind({"focus.selectBoxIt":function(){$(this).addClass(b)},"blur.selectBoxIt":function(){$(this).removeClass(b)}}),this.selectBox.bind({"open.selectBoxIt":function(){a.div.removeClass(c).add(a.listItems.eq(a.currentFocus)).addClass(b)},"blur.selectBoxIt":function(){a.div.removeClass(b)},"mouseenter.selectBoxIt":function(){a.div.addClass(c)},"mouseleave.selectBoxIt":function(){a.div.removeClass(c)}}),this.listItems.bind({"mouseenter.selectBoxIt":function(){a.listItems.removeClass(b),$(this).addClass(c)},"mouseleave.selectBoxIt":function(){$(this).removeClass(c)}}),this.downArrow.css({"margin-top":this.downArrowContainer.height()/3}),this}});
$(function(){$.selectBox.selectBoxIt.prototype.moveDown=function(a){this.currentFocus+=1;var b=this.listItems.eq(this.currentFocus).data("disabled"),c=this.listItems.eq(this.currentFocus).nextAll("li").not("[data-disabled='true']").first().length;if(this.currentFocus===this.listItems.length)this.currentFocus-=1;else{if(b&&c){this.listItems.eq(this.currentFocus-1).blur(),this.moveDown();return}b&&!c?this.currentFocus-=1:(this.listItems.eq(this.currentFocus-1).blur().end().eq(this.currentFocus).focus(),this._scrollToView("down"),this.selectBox.trigger("moveDown"))}return this._callbackSupport(a),this},$.selectBox.selectBoxIt.prototype.moveUp=function(a){this.currentFocus-=1;var b=this.listItems.eq(this.currentFocus).data("disabled"),c=this.listItems.eq(this.currentFocus).prevAll("li").not("[data-disabled='true']").first().length;if(this.currentFocus===-1)this.currentFocus+=1;else{if(b&&c){this.listItems.eq(this.currentFocus+1).blur(),this.moveUp();return}b&&!c?this.currentFocus+=1:(this.listItems.eq(this.currentFocus+1).blur().end().eq(this.currentFocus).focus(),this._scrollToView("up"),this.selectBox.trigger("moveUp"))}return this._callbackSupport(a),this}});
$(function(){$.selectBox.selectBoxIt.prototype._setCurrentSearchOption=function(a){return(a!==0||!!this.options.showFirstOption)&&this.listItems.eq(a).data("disabled")!==!0&&(this.divText.text(this.textArray[a]),this.listItems.eq(this.currentFocus).blur(),this.currentIndex=a,this.currentFocus=a,this.listItems.eq(this.currentFocus).focus(),this._scrollToView("search"),this.selectBox.trigger("search")),this},$.selectBox.selectBoxIt.prototype._searchAlgorithm=function(a,b){var c=!1,d,e,f;for(d=a,f=this.textArray.length;d<f;d+=1){for(e=0;e<f;e+=1)this.textArray[e].search(b)!==-1&&(c=!0,e=f);c||(this.currentText=this.currentText.charAt(this.currentText.length-1).replace(/[|()\[{.+*?$\\]/g,"\\$0"),b=new RegExp(this.currentText,"gi"));if(this.currentText.length<2){if(this.textArray[d].charAt(0).search(b)!==-1)return this._setCurrentSearchOption(d),this.currentIndex+=1,!1}else if(this.textArray[d].search(b)!==-1)return this._setCurrentSearchOption(d),!1;if(this.textArray[d].toLowerCase()===this.currentText.toLowerCase())return this._setCurrentSearchOption(d),this.currentText="",!1}return!0},$.selectBox.selectBoxIt.prototype.search=function(a,b,c){b?this.currentText+=a.replace(/[|()\[{.+*?$\\]/g,"\\$0"):this.currentText=a.replace(/[|()\[{.+*?$\\]/g,"\\$0");var d=new RegExp(this.currentText,"gi"),e=this._searchAlgorithm(this.currentIndex,d);return e&&this._searchAlgorithm(0,d),this._callbackSupport(c),this}});
$(function(){$.selectBox.selectBoxIt.prototype.setOption=function(a,b,c){return a==="showFirstOption"&&!b?this.listItems.eq(0).hide():a==="showFirstOption"&&b?this.listItems.eq(0).show():a==="defaultIcon"&&b?this.divImage.attr("class",b):a==="downArrowIcon"&&b?this.downArrow.attr("class",b):a==="defaultText"&&this.divText.text(b),$.Widget.prototype._setOption.apply(this,arguments),this._callbackSupport(c),this}});
$(function(){$.selectBox.selectBoxIt.prototype.setOptions=function(a,b){return $.Widget.prototype._setOptions.apply(this,arguments),this.options.showFirstOption?this.listItems.eq(0).show():this.listItems.eq(0).hide(),this.options.defaultIcon&&this.divImage.attr("class",this.options.defaultIcon),this.options.downArrowIcon&&this.downArrow.attr("class",this.options.downArrowIcon),this.options.defaultText&&this.divText.text(this.options.defaultText),this._callbackSupport(b),this}});
$(function(){$.selectBox.selectBoxIt.prototype.wait=function(a,b){var c=this,d=this.returnTimeout(a);return d.then(function(){c._callbackSupport(b)}),this},$.selectBox.selectBoxIt.prototype.returnTimeout=function(a){return $.Deferred(function(b){setTimeout(b.resolve,a)})}});