import de.voidplus.dollar.*;

OneDollar one;
int r = 0, g = 0, b = 0;
int penSize = 5;
String shape = "freeform-line";
ArrayList<Line> lines = new ArrayList<Line>();;
ArrayList<Rectangle> rectangles = new ArrayList<Rectangle>();
ArrayList<Oval> ovals = new ArrayList<Oval>();
String inputScheme = "keyboard";
boolean sKeyPressed = false;
boolean cKeyPressed = false;
boolean wKeyPressed = false;
Info infoWindow;
boolean iKeyPressed = false;
boolean showInfoWindow = false;

class Line {
    int x1, y1, x2, y2;
    int r, g, b;
    int penSize;

    Line(int x1, int y1, int x2, int y2, int r, int g, int b, int penSize) {
        this.x1 = x1;
        this.y1 = y1;
        this.x2 = x2;
        this.y2 = y2;
        this.r = r;
        this.g = g;
        this.b = b;
        this.penSize = penSize;
    }

    void display() {
        stroke(r, g, b);
        strokeWeight(penSize);
        line(x1, y1, x2, y2);
    }
}

class Rectangle {
    int x, y, w, h;
    int r, g, b;
    int penSize;

    Rectangle(int x, int y, int w, int h, int r, int g, int b, int penSize) {
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
        this.r = r;
        this.g = g;
        this.b = b;
        this.penSize = penSize;
    }

    void display() {
        stroke(r, g, b);
        strokeWeight(penSize);
        noFill();
        rect(x, y, w, h);
    }
}

class Oval {
    int x, y, w, h;
    int r, g, b;
    int penSize;

    Oval(int x, int y, int w, int h, int r, int g, int b, int penSize) {
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
        this.r = r;
        this.g = g;
        this.b = b;
        this.penSize = penSize;
    }

    void display() {
        stroke(r, g, b);
        strokeWeight(penSize);
        noFill();
        ellipse(x, y, w, h);
    }
}

void setup() {
    // fullScreen();
    size(800, 600);
    background(255);

    infoWindow = new Info();

    one = new OneDollar(this);
    one.disableAutoCheck();

    one.learn("squiggly", new int[] {138,177,138,176,139,175,139,174,139,173,139,171,140,170,140,169,141,167,142,166,143,165,144,163,145,161,146,161,147,160,147,160,147,160,147,160,147,160,148,159,149,159,149,159,150,159,152,158,154,157,156,157,157,157,157,157,158,157,159,157,159,157,160,157,160,157,161,157,162,158,163,158,164,160,166,162,167,162,169,163,170,165,172,166,173,167,173,167,174,168,175,168,178,170,180,171,183,172,184,173,187,173,191,173,192,173,195,173,196,173,198,173,199,173,200,172,201,171,202,171,202,170,203,170,204,168,204,167,206,165,207,164,208,163,209,161,209,160,210,159,210,158,211,158,211,157,211,157,212,156,212,156,212,156,212,155,212,155,212,155,212,155,});
    one.learn("straight", new int[] {270,108,270,108,271,109,272,110,274,111,278,114,281,117,285,120,290,124,293,125,305,133,311,133,320,137,324,140,335,144,338,146,342,147,343,147,343,147,343,147,343,147,343,147,342,148,340,149,338,151,334,154,329,158,322,163,310,171,294,181,284,188,269,196,257,204,249,209,240,215,235,218,233,219,232,220,232,220,});
    one.learn("rectangle", new int[] {192,101,192,101,191,101,191,101,190,101,189,101,188,100,185,100,184,100,182,100,180,100,178,100,176,100,173,100,170,100,166,100,163,100,156,100,151,100,149,100,140,100,132,100,126,100,117,100,111,100,107,100,102,101,100,102,97,102,97,102,96,103,95,103,94,103,92,103,88,104,86,104,84,105,83,105,83,105,82,105,82,105,82,105,82,106,82,106,82,106,82,106,82,108,82,110,82,113,83,123,83,128,83,135,83,142,83,146,83,151,83,154,83,158,83,161,83,165,83,168,83,169,83,171,83,171,83,173,83,174,83,175,83,175,83,176,83,177,83,179,83,181,82,183,82,185,82,185,82,186,82,186,82,186,83,186,84,186,88,185,91,185,100,185,108,185,137,186,150,187,158,188,166,189,173,190,180,190,180,190,182,190,182,190,183,190,183,190,183,190,184,190,185,190,186,190,187,191,189,191,191,191,193,191,194,191,194,191,194,191,194,191,195,191,195,191,195,191,194,191,194,190,194,190,194,189,194,188,194,188,195,186,195,183,195,175,195,167,195,162,195,149,194,141,194,135,193,126,192,118,192,115,192,113,191,111,191,110,191,110,191,110,191,109,191,109,191,109,191,109,191,109,191,108,191,108,191,108,191,107,191,107,191,107,191,106,});
    one.learn("rectangle_2", new int[] { 135,141 , 133,144 , 132,146 , 132,146 /* ... */ });
    one.learn("oval", new int[] {127,141,124,140,120,139,118,139,116,139,111,140,109,141,104,144,100,147,96,152,93,157,90,163,87,169,85,175,83,181,82,190,82,195,83,200,84,205,88,213,91,216,96,219,103,222,108,224,111,224,120,224,133,223,142,222,152,218,160,214,167,210,173,204,178,198,179,196,182,188,182,177,178,167,170,150,163,138,152,130,143,129,140,131,129,136,126,139} );
    one.learn("oval_clockwise", new int[] {190,157,191,157,192,157,193,157,196,157,199,157,203,157,208,157,210,157,214,158,220,158,224,159,230,159,233,160,235,161,238,162,239,163,239,163,241,165,242,166,243,167,245,169,247,172,249,174,251,176,253,178,254,180,255,184,256,187,257,188,258,192,258,197,259,200,259,202,259,206,259,209,259,212,259,213,259,214,258,216,257,219,257,220,256,222,256,222,255,223,252,226,250,228,248,229,247,230,244,232,240,234,235,236,231,238,227,239,226,239,224,239,222,240,219,240,216,240,214,241,213,241,212,241,209,242,208,242,207,242,203,242,201,242,200,242,199,242,197,242,197,242,196,242,194,241,192,241,190,240,188,239,186,237,185,236,182,234,181,233,179,231,177,229,176,227,175,226,173,224,171,220,170,219,168,215,167,212,166,209,165,208,164,205,164,202,163,198,162,195,161,191,160,188,160,186,160,184,160,183,160,181,160,180,160,179,160,177,160,176,160,176,161,175,161,175,161,174,162,174,162,173,163,173,163,172,164,171,165,170,165,170,167,169,169,167,170,165,172,164,173,164,173,163,174,163,174,163,175,163,175,162,175,162,176,162,176,162,176,161,177,161,177,161,178,161,178,161,178,160,178,160,178,160,178,160,178,160,179,160,179,159,180,159,180,159,181,159,181,158,181,158,181,158,181,158,182,158,182,158,182,158,183,158,184,158,185,158,185,158,185,158,186,158,186,158,186,158,187,158,187,158,187,158,187,158,188,158,188,158,188,158,189,158,189,158,189,158,190,158,190,158,190,158,190,158,191,158,});

    one.learn("weight", new int[] {138,109,139,110,139,112,139,116,141,122,141,126,142,132,142,141,144,150,144,157,144,162,144,169,144,174,144,176,144,179,144,180,144,180,144,180,144,180,144,181,144,183,144,185,144,186,144,187,144,188,145,188,145,188,145,187,149,180,153,175,157,171,162,166,164,163,169,158,173,155,177,151,180,149,182,148,184,145,185,144,186,143,186,143,187,142,187,142,187,142,187,142,188,142,188,141,188,141,189,141,189,141,189,141,189,141,190,142,192,145,195,149,198,153,203,159,206,164,211,169,214,172,218,176,224,182,230,187,233,190,235,191,236,192,237,192,237,192,238,190,239,187,240,183,242,176,242,170,245,156,247,145,250,129,251,118,253,109,254,105,255,102,255,102,255,101,});

    one.learn("colour", new int[] {176,119,176,119,175,119,175,119,174,119,170,117,167,117,164,117,160,117,155,117,151,117,148,117,145,118,143,118,141,119,139,119,138,120,137,121,136,121,133,123,132,125,130,125,129,127,127,128,125,130,124,131,123,132,122,133,122,135,121,136,121,137,121,139,120,141,120,142,119,145,119,148,118,150,118,152,118,152,117,153,117,155,117,156,117,157,117,158,118,158,118,159,118,159,118,160,118,161,119,162,120,163,122,165,124,167,124,168,125,168,126,170,127,171,130,172,134,174,138,176,139,176,145,177,149,177,152,178,155,178,162,178,166,178,169,178,175,178,179,178,182,177,185,177,187,176,188,176,188,176,188,175,189,175,189,175,189,175,});

    one.bind("squiggly straight rectangle rectangle_2 oval oval_clockwise", "gestureDetected");
    one.bind("weight", "gestureDetected");
    one.bind("colour", "gestureDetected");
}

void gestureDetected(String gesture, float percent, int startX, int startY, int centroidX, int centroidY, int endX, int endY) {
    if (inputScheme.equals("gesture")) {
        if (gesture.equals("squiggly")) {
            shape = "freeform-line";
        } else if (gesture.equals("straight")) {
            shape = "straight-line";
        } else if (gesture.equals("rectangle") || gesture.equals("rectangle_2")) {
            shape = "rectangle";
        } else if (gesture.equals("oval") || gesture.equals("oval_clockwise")) {
            shape = "oval";
        } else if (gesture.equals("colour")) {
            if (r == 0 && g == 0 && b == 0) {
                r = 255;
            } else if (r == 255 && g == 0 && b == 0) {
                r = 0;
                g = 255;
                b = 0;
            } else if (r == 0 && g == 255 && b == 0) {
                r = 0;
                g = 0;
                b = 255;
            } else if (r == 0 && g == 0 && b == 255) {
                r = 255;
                g = 0;
                b = 0;
            }
        } else if (gesture.equals("weight")) {
            if (penSize == 5) {
                penSize = 15;
            } else if (penSize == 15) {
                penSize = 25;
            } else if (penSize == 25) {
                penSize = 5;
            }
        }
    }
}

void drawStatusBar() {
    fill(255);
    stroke(0);
    strokeWeight(2);
    rect(width - 150, 0, 150, 63);
    fill(0);
    textAlign(LEFT, TOP);
    textFont(createFont("Lucida Sans", 11));
    text("Press 'i' for more info", width - 131, 47);
    fill(255);

    if (shape.equals("freeform-line")) {
        arc(width - 130, 25, 10, 10, radians(180), radians(360));
        arc(width - 120, 25, 10, 10, radians(0), radians(180));
    } else if (shape.equals("straight-line")) {
        stroke(0);
        line(width - 135, 35, width - 110, 15);
    } else if (shape.equals("rectangle")) {
        noFill();
        rect(width - 134, 17, 33, 15);
    } else if (shape.equals("oval")) {
        noFill();
        ellipse(width - 120, 25, 20, 20);
    }

    fill(r, g, b);
    rect(width - 85, 10, 30, 30);

    fill(0);
    if (penSize == 5) {
        ellipse(width - 30, 25, 5, 5);
    } else if (penSize == 15) {
        ellipse(width - 30, 25, 15, 15);
    } else if (penSize == 25) {
        ellipse(width - 30, 25, 25, 25);
    }
}


void draw() {
    background(255);

    if (inputScheme.equals("gesture") && !showInfoWindow) {
        one.draw();
    }

    for (Line line : lines) {
        line.display();
    }
    for (Rectangle rectangle : rectangles) {
        rectangle.display();
    }
    for (Oval oval : ovals) {
        oval.display();
    }

    drawStatusBar();

    if (showInfoWindow) {
        infoWindow.display();
    }

    stroke(r, g, b);
    strokeWeight(penSize);
    if (shape.equals("freeform-line")) {
        if (mousePressed && (mouseButton == LEFT) && !showInfoWindow) {
            if (!(mouseY > 0 && mouseY < 65 && mouseX > width - 150)) {
                line(pmouseX, pmouseY, mouseX, mouseY);
                lines.add(new Line(pmouseX, pmouseY, mouseX, mouseY, r, g, b, penSize));
            }
        }
    }
}

void mousePressed() {
    if (mouseButton == LEFT && !showInfoWindow) {
        if (shape.equals("straight-line")) {
            lines.add(new Line(pmouseX, pmouseY, mouseX, mouseY, r, g, b, penSize));
        } else if (shape.equals("rectangle")) {
            rectangles.add(new Rectangle(mouseX, mouseY, 1, 1, r, g, b, penSize));
        } else if (shape.equals("oval")) {
            ovals.add(new Oval(mouseX, mouseY, 1, 1, r, g, b, penSize));
        }
    }
}

void mouseDragged() {
    if (mouseButton == LEFT && !showInfoWindow) {
        if (shape.equals("straight-line")) {
            Line line = lines.get(lines.size() - 1);
            line.x2 = mouseX;
            line.y2 = mouseY;
        } else if (shape.equals("rectangle")) {
            Rectangle rectangle = rectangles.get(rectangles.size()-1);
            rectangle.w = mouseX - rectangle.x;
            rectangle.h = mouseY - rectangle.y;
        } else if (shape.equals("oval")) {
            Oval oval = ovals.get(ovals.size()-1);
            oval.w = mouseX - oval.x;
            oval.h = mouseY - oval.y;
        }
    } else if (mouseButton == RIGHT && inputScheme.equals("gesture") && !showInfoWindow) {
        one.track(mouseX, mouseY);
    }
}

void mouseReleased() {
    if (mouseButton == LEFT && !showInfoWindow) {
        if (shape.equals("straight-line")) {
            Line line = lines.get(lines.size() - 1);
            line.x2 = mouseX;
            line.y2 = mouseY;
        }
    } else if (mouseButton == RIGHT && inputScheme.equals("gesture") && !showInfoWindow) {
        one.check();
    }
}

void keyPressed() {
    if ((key == 'i' || key == 'I') && !iKeyPressed) {
        iKeyPressed = true;
        if (showInfoWindow) {
            showInfoWindow = false;
        } else {
            showInfoWindow = true;
        }
    }

    if (key == BACKSPACE && !showInfoWindow) {
        if (shape.equals("freeform-line") || shape.equals("straight-line")) {
            if (lines.size() > 0) {
                lines.remove(lines.size() - 1);
            }
        } else if (shape.equals("rectangle")) {
            if (rectangles.size() > 0) {
                rectangles.remove(rectangles.size() - 1);
            }
        } else if (shape.equals("oval")) {
            if (ovals.size() > 0) {
                ovals.remove(ovals.size() - 1);
            }
        }
    }

    if (keyCode == SHIFT && !showInfoWindow) {
        if (inputScheme.equals("keyboard")) {
            inputScheme = "gesture";
        } else if (inputScheme.equals("gesture")) {
            inputScheme = "keyboard";
        }
    }

    if (inputScheme.equals("keyboard") && !showInfoWindow) {
        if ((key == 's' || key == 'S') && !sKeyPressed) {
            sKeyPressed = true;
            if (shape.equals("freeform-line")) {
                shape = "straight-line";
            } else if (shape.equals("straight-line")) {
                shape = "rectangle";
            } else if (shape.equals("rectangle")) {
                shape = "oval";
            } else if (shape.equals("oval")) {
                shape = "freeform-line";
            }
        } else if ((key == 'c' || key == 'C') && !cKeyPressed) {
            cKeyPressed = true;
            if (r == 0 && g == 0 && b == 0) {
                r = 255;
                g = 0;
                b = 0;
            } else if (r == 255 && g == 0 && b == 0) {
                r = 0;
                g = 255;
                b = 0;
            } else if (r == 0 && g == 255 && b == 0) {
                r = 0;
                g = 0;
                b = 255;
            } else if (r == 0 && g == 0 && b == 255) {
                r = 0;
                g = 0;
                b = 0;
            }
        } else if ((key == 'w' || key == 'W') && !wKeyPressed) {
            wKeyPressed = true;
            if (penSize == 5) {
                penSize = 15;
            } else if (penSize == 15) {
                penSize = 25;
            } else if (penSize == 25) {
                penSize = 5;
            }
        }
    }
}


void keyReleased() {
    if (inputScheme.equals("keyboard")) {
        if (key == 's' || key == 'S') {
            sKeyPressed = false;
        } else if (key == 'c' || key == 'C') {
            cKeyPressed = false;
        } else if (key == 'w' || key == 'W') {
            wKeyPressed = false;
        }
    }
    if (key == 'i' || key == 'I') {
        iKeyPressed = false;
    }
}

class Info {
    String title = "Sketch";
    String version = "1.0.0";
    String author = "VarunS2002";
    String message = "This is a simple sketching application created using Processing.";
    int w = 400;
    int h = 460;
    int x = (width-w)/2;
    int y = (height-h)/2;

    void display() {

        fill(255);
        rect(x, y, w, h);

        fill(0);
        textFont(createFont("Arial", 15));

        textAlign(CENTER, TOP);
        textSize(18);
        text(title, x + w/2, y + 20);

        textAlign(CENTER, TOP);
        textSize(12);
        text("v" + version, x + w/2, y + 40);
        text(author, x + w/2, y + 55);
        textSize(15);
        textAlign(LEFT, TOP);
        text(message, x + 20, y + 80, w - 40, h - 100);

        textAlign(LEFT, TOP);
        text("Common Keyboard Shortcuts:", x + 20, y + 130);
        text("I:                          Show/hide this window", x + 20, y + 150);
        text("BACKSPACE:     Delete last shape", x + 20, y + 170);
        text("SHIFT:                 Toggle input scheme", x + 20, y + 190);

        text("Input Scheme 1 (Keyboard): ", x + 20, y + 220);
        text("S:                        Change shape", x + 20, y + 240);
        text("C:                        Change colour", x + 20, y + 260);
        text("W:                       Change pen stroke weight", x + 20, y + 280);

        text("Input Scheme 2 (Gesture with right mouse button): ", x + 20, y + 310);
        text("~:                        Freeform line", x + 20, y + 330);
        text(">:                        Straight line", x + 20, y + 350);
        text("◻:                        Rectangle", x + 20, y + 370);
        text("o:                        Oval", x + 20, y + 390);
        text("c:                        Change colour", x + 20, y + 410);
        text("w:                       Change pen stroke weight", x + 20, y + 430);
    }
}
