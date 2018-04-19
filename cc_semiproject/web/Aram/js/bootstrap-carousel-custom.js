/*
    이 플러그인은 bootstrap-carousel.js 을 아래 링크를 참고하여 터치가 가능하도록 수정한 것입니다.

    https://github.com/twitter/bootstrap/pull/2640#commits-pushed-6ad4546
    https://github.com/twitter/bootstrap/commit/0c83c02ceba7b126e91950c3ee8fb84540cc04bf

    star 2013.11.01

    - bootstrap-transition.js 이 함께 있어야 합니다.
    - touch 옵션을 true로 해주어야 합니다.
*/

/* ==========================================================
* bootstrap-carousel.js v2.0.2
* http://twitter.github.com/bootstrap/javascript.html#carousel
* ==========================================================
* Copyright 2012 Twitter, Inc.
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
* ========================================================== */

!function ($) {

    "use strict"; // jshint ;_;

    /* CAROUSEL CLASS DEFINITION
    * ========================= */

    var Carousel = function (element, options) {
        this.$element = $(element)
        this.options = $.extend({}, $.fn.carousel.defaults, options)
        this.options.slide && this.slide(this.options.slide)
        this.options.pause == 'hover' && this.$element
            .on('mouseenter', $.proxy(this.pause, this))
            .on('mouseleave', $.proxy(this.cycle, this))

        this.touch = {
            supported: "ontouchend" in document
            , startedAt: 0
            , startPositionX: 0
            , startPositionY: 0
        }

        //this.isGesture = false
        this.isVerticalSwipe = false; //  세로로 스와이프일 경우

        if (this.options.touch && this.touch.supported == true) {
            this.$element
            .on('touchstart', $.proxy(this.touchstart, this))
            .on('touchend', $.proxy(this.touchend, this))
            .on('touchmove', $.proxy(this.touchmove, this))

            this.options.touchHideControls && this.$element
            .children('.carousel-control').fadeOut('slow')
        }
    }

    Carousel.prototype = {

        cycle: function (e) {
            if (!e) this.paused = false
            if (this.interval) clearInterval(this.interval);
            this.options.interval
              && !this.paused
              && (this.interval = setInterval($.proxy(this.next, this), this.options.interval))
            return this
        }

        , to: function (pos) {
            var $active = this.$element.find('.active')
                , children = $active.parent().children()
                , activePos = children.index($active)
                , that = this

            if (pos > (children.length - 1) || pos < 0) return

            if (this.sliding) {
                return this.$element.one('slid', function () {
                    that.to(pos)
                })
            }

            if (activePos == pos) {
                return this.pause().cycle()
            }

            return this.slide(pos > activePos ? 'next' : 'prev', $(children[pos]))
        }

        , pause: function () {
            clearInterval(this.interval)
            this.interval = null
            return this
        }

        , prev: function () {
            if (this.sliding) return
            return this.slide('prev')
        }

        , next: function () {
            if (this.sliding) return
            return this.slide('next')
        }

        , slide: function (type, next) {

            var $active = this.$element.find('.active')
                , $next = next || $active[type]()
                , isCycling = this.interval
                , direction = type == 'next' ? 'left' : 'right'
                , fallback = type == 'next' ? 'first' : 'last'
                , that = this

            this.sliding = true

            isCycling && this.pause()

            $next = $next.length ? $next : this.$element.find('.item')[fallback]()

            if ($next.hasClass('active')) return

            if (!$.support.transition && this.$element.hasClass('slide')) {
                this.$element.trigger('slide', { direction: type })
                $active.removeClass('active')
                $next.addClass('active')
                this.sliding = false
                this.$element.trigger('slid', { direction: type })
            } else {
                $next.addClass(type)
                $next[0].offsetWidth // force reflow
                $active.addClass(direction)
                $next.addClass(direction)
                this.$element.trigger('slide', { direction: type })
                this.$element.one($.support.transition.end, function () {
                    $next.removeClass([type, direction].join(' ')).addClass('active')
                    $active.removeClass(['active', direction].join(' '))
                    that.sliding = false
                    setTimeout(function () { that.$element.trigger('slid', { direction: type }) }, 0)
                })
            }

            isCycling && this.cycle()

            return this
        }

        , touchstart: function (e) {

            //ios에서는 이미지 사이즈 조절이 가능하도록 조절할 수 있으나 안드로이드는 안됨
            //if (this.iOS && e.originalEvent.touches.length > 1) {
            //    this.isGesture = true;
            //    return;
            //}

            //e.preventDefault();

            //this.isGesture = false;
            this.isVerticalSwipe = false;
            this.touch.startedAt = e.timeStamp
            this.touch.startPositionX = e.originalEvent.touches ? e.originalEvent.touches[0].pageX : e.pageX
            this.touch.startPositionY = e.originalEvent.touches ? e.originalEvent.touches[0].pageY : e.pageY
        }

        , touchend: function (e) {

            //if (this.isGesture) {
            //return;
            //}

            if (this.isVerticalSwipe) {
                return;
            }

            this.touch.startedAt = 0
            this.touch.startPositionX = 0
            this.touch.startPositionY = 0
        }

        , touchmove: function (e) {

            //if (this.isGesture) {
            //return;
            //}

            e.preventDefault();

            var currentX = e.originalEvent.touches ? e.originalEvent.touches[0].pageX : e.pageX,
                currentY = e.originalEvent.touches ? e.originalEvent.touches[0].pageY : e.pageY,
                currentDistanceX = (this.touch.startPositionX === 0) ? 0 : Math.abs(currentX - this.touch.startPositionX),
                currentDistanceY = (this.touch.startPositionY === 0) ? 0 : Math.abs(currentY - this.touch.startPositionY),
                currentDistanceYnotABS = (this.touch.startPositionY === 0) ? 0 : currentY - this.touch.startPositionY,
                currentTime = e.timeStamp

            //스크롤 있는 컨텐츠의 경우 스와이프가 아닌 스크롤이 움직이게
            if (currentDistanceY > 20 && $(document).height() > $(window).height()) {

                var scrollPosY = $(document).scrollTop();
                //손동작이 위에서 아래로
                if (currentDistanceYnotABS > 0) {
                    if (scrollPosY != 0) {
                        $(document).scrollTop(scrollPosY - currentDistanceYnotABS)
                    }
                }
                    // 손동작이 아래에서 위로
                else {
                    if (scrollPosY != $(document).height()) {
                        $(document).scrollTop(scrollPosY - currentDistanceYnotABS)
                    }
                }
                this.isVerticalSwipe = true
                return
            }

            if (this.isVerticalSwipe == false && this.touch.startedAt !== 0 && currentTime - this.touch.startedAt < this.options.touchMaxTime && currentDistanceX > this.options.touchMaxDistance) {
                if (currentX < this.touch.startPositionX) {
                    this.next().pause();
                } else if (currentX > this.touch.startPositionX) {
                    this.prev().pause();
                }

                this.touch.startedAt = 0
                this.touch.startPositionX = 0
                this.touch.startPositionY = 0
            }
        }
    }


    /* CAROUSEL PLUGIN DEFINITION
    * ========================== */

    $.fn.carousel = function (option) {
        return this.each(function () {
            var $this = $(this)
            , data = $this.data('carousel')
            , options = typeof option == 'object' && option
            if (!data) $this.data('carousel', (data = new Carousel(this, options)))
            if (typeof option == 'number') data.to(option)
            else if (typeof option == 'string' || (option = options.slide)) data[option]()
            else data.cycle()
        })
    }

    $.fn.carousel.defaults = {
        interval: true
        , intervalTime: 5000
        , pause: 'hover'
        , touch: false
        , touchMaxTime: 1000
        , touchMaxDistance: 50
        , touchHideControls: true
    }

    $.fn.carousel.Constructor = Carousel


    /* CAROUSEL DATA-API
    * ================= */

    $(function () {
        $('body').on('touchstart.carousel.data-api click.carousel.data-api', '[data-slide]', function (e) {
            var $this = $(this), href
            , $target = $($this.attr('data-target') || (href = $this.attr('href')) && href.replace(/.*(?=#[^\s]+$)/, '')) //strip for ie7
            , options = !$target.data('modal') && $.extend({}, $target.data(), $this.data())
            $target.carousel(options)
            e.preventDefault()
        })
    })

}(window.jQuery);
