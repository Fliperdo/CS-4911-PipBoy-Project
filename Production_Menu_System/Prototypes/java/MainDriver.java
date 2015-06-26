class MainDriver() {
	public static Map<String, String> status;
	public static Map<Integer, List> pages;
	
	public MainDriver(){
			UI mainUI = new UI();
			Input input = new Input();
			Output output = new Output();
			this.status = new HashMap<String, String>();
			this.pages = new HashMap<Integer, List>();
			pages.add(1, [1, 2, 3, 4, 5]; 2, [6, 7, 8, 9]; 3, [10, 11, 12, 13, 14]);
			// Initialize status variables
	}
	
	void setup(){
		// constructor stuff can move in here probably
	}
	
	void readInput(){
		Input.read(); // get input
	}
	
	void updateState(){
		// update status variable
	}
	
	void draw() {
		mainUI.draw(); // ???
	}
	
	void writeOutput() {
		Output.write(); // Send IO signals
	}
	
}s
	}
	
}
}