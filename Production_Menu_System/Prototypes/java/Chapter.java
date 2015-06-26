class Chapter implements Drawable {
	private List<Integer> pages;
	
	public Chapter(){
			this.pages = status{"Chapter"};
			//determine correct pages for this chapter
	}
	
	void draw(){
		chapter = state{"Chapter"};
		Page p = new Page(pageNum)
		p.draw();
		// draw the first page in this chapter as the default homepage
	}
}