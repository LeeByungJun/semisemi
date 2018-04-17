package freeboard.model.vo;
import java.sql.Date;

	//렌트후기 게시판 객체
	public class FreeBoard  implements java.io.Serializable{
		private  static final long serialVersionUID = 13L;
		private int fb_num;						//게시글 번호(sequence)
		private String fb_subject; 				//게시글 제목
		private String fb_writer; 				//게시글 작성자
		private String fb_content; 				//게시글 내용
		private int fb_hits;			   		//조회수
		private Date fb_date;
		//게시글 번호를 통해 댓글 테이블 참조.
		
		public FreeBoard() {}
		
		public int getFb_num() {
			return fb_num;
		}
		public void setFb_num(int fb_num) {
			this.fb_num = fb_num;
		}
		public String getFb_subject() {
			return fb_subject;
		}
		public void setFb_subject(String fb_subject) {
			this.fb_subject = fb_subject;
		}
		public String getFb_writer() {
			return fb_writer;
		}
		public void setFb_writer(String fb_writer) {
			this.fb_writer = fb_writer;
		}
		public String getFb_content() {
			return fb_content;
		}
		public void setFb_content(String fb_content) {
			this.fb_content = fb_content;
		}
		public int getFb_hits() {
			return fb_hits;
		}
		public void setFb_hits(int fb_hits) {
			this.fb_hits = fb_hits;
		}
		public Date getFb_date() {
			return fb_date;
		}
		public void setFb_date(Date fb_date) {
			this.fb_date = fb_date;
		}
		public static long getSerialversionuid() {
			return serialVersionUID;
		}

		@Override
		public String toString() {
			return "FreeBoard [fb_num=" + fb_num + ", fb_subject=" + fb_subject + ", fb_writer=" + fb_writer
					+ ", fb_content=" + fb_content + ", fb_hits=" + fb_hits + ", fb_date=" + fb_date + ", getFb_num()="
					+ getFb_num() + ", getFb_subject()=" + getFb_subject() + ", getFb_writer()=" + getFb_writer()
					+ ", getFb_content()=" + getFb_content() + ", getFb_hits()=" + getFb_hits() + ", getFb_date()="
					+ getFb_date() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
					+ super.toString() + "]";
		}
		
		
		
		
		
		
		
	}