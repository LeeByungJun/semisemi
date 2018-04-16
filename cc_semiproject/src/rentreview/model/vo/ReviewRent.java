package rentreview.model.vo;
import java.sql.Date;

	//렌트후기 게시판 객체
	public class ReviewRent  implements java.io.Serializable{
		private  static final long serialVersionUID = 13L;
		private int rr_num;						//게시글 번호(sequence)
		private String rr_subject; 				//게시글 제목
		private String rr_writer; 				//게시글 작성자
		private String rr_content; 				//게시글 내용
		private String rr_original_filename; 	//첨부파일 첫 경로
		private String rr_rename_filename; 		//첨부파일 수정된 경로
		private int rr_hits;			   		//조회수
		private Date rr_date;
		private String originalFilePath;//글 작성일
		private String renameFilePath;
		//게시글 번호를 통해 댓글 테이블 참조.
		public ReviewRent() {
			// TODO Auto-generated constructor stub
		}
		public int getRr_num() {
			return rr_num;
		}
		public void setRr_num(int rr_num) {
			this.rr_num = rr_num;
		}
		public String getRr_subject() {
			return rr_subject;
		}
		public void setRr_subject(String rr_subject) {
			this.rr_subject = rr_subject;
		}
		public String getRr_writer() {
			return rr_writer;
		}
		public void setRr_writer(String rr_writer) {
			this.rr_writer = rr_writer;
		}
		public String getRr_content() {
			return rr_content;
		}
		public void setRr_content(String rr_content) {
			this.rr_content = rr_content;
		}
		public String getRr_original_filename() {
			return rr_original_filename;
		}
		public void setRr_original_filename(String rr_original_filename) {
			this.rr_original_filename = rr_original_filename;
		}
		public String getRr_rename_filename() {
			return rr_rename_filename;
		}
		public void setRr_rename_filename(String rr_rename_filename) {
			this.rr_rename_filename = rr_rename_filename;
		}
		public int getRr_hits() {
			return rr_hits;
		}
		public void setRr_hits(int rr_hits) {
			this.rr_hits = rr_hits;
		}
		public Date getRr_date() {
			return rr_date;
		}
		public void setRr_date(Date rr_date) {
			this.rr_date = rr_date;
		}
		public String getOriginalFilePath() {
			return originalFilePath;
		}
		public void setOriginalFilePath(String originalFilePath) {
			this.originalFilePath = originalFilePath;
		}
		public String getRenameFilePath() {
			return renameFilePath;
		}
		public void setRenameFilePath(String renameFilePath) {
			this.renameFilePath = renameFilePath;
		}

		@Override
		public String toString() {
			return "ReviewRent [rr_num=" + rr_num + ", rr_subject=" + rr_subject + ", rr_writer=" + rr_writer
					+ ", rr_content=" + rr_content + ", rr_original_filename=" + rr_original_filename
					+ ", rr_rename_filename=" + rr_rename_filename + ", rr_hits=" + rr_hits + ", rr_date=" + rr_date
					+ ", originalFilePath=" + originalFilePath + ", renameFilePath=" + renameFilePath + ", getRr_num()="
					+ getRr_num() + ", getRr_subject()=" + getRr_subject() + ", getRr_writer()=" + getRr_writer()
					+ ", getRr_content()=" + getRr_content() + ", getRr_original_filename()="
					+ getRr_original_filename() + ", getRr_rename_filename()=" + getRr_rename_filename()
					+ ", getRr_hits()=" + getRr_hits() + ", getRr_date()=" + getRr_date() + ", getOriginalFilePath()="
					+ getOriginalFilePath() + ", getRenameFilePath()=" + getRenameFilePath() + ", getClass()="
					+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
		}
		
	}