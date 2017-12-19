import SimpleOpenNI.*;

// import and declarations for minim:
import ddf.minim.*;
Minim minim, minim1;
AudioPlayer noteC, noteD, noteE, noteF, noteG, noteA, noteB, noteC2, VnoteC, 
VnoteD, VnoteE, VnoteF, VnoteG, VnoteA, VnoteB, VnoteC2, XnoteC, XnoteD, XnoteE, XnoteF, 
XnoteG, XnoteA, XnoteB, XnoteC2;
// declare our poser object
SkeletonPoser poseC, poseD, poseE, poseF, poseG, poseA, poseB, poseC2, poseChange;
PImage pianoimg, xyloimg, violinimg, cimg, dimg, eimg, fimg, gimg, aimg, bimg, c2img;
int instrument = 0;

SimpleOpenNI  kinect;
void settings(){
  size(640, 480);

}

void setup() {
  
  kinect = new SimpleOpenNI(this);
  kinect.enableDepth();
  kinect.enableUser();
  kinect.setMirror(true);

  // initialize the minim object
  minim = new Minim(this);
  
  pianoimg = loadImage("icons/piano.png");
  xyloimg = loadImage("icons/xylophone.png");
  violinimg = loadImage("icons/violin.png");
  cimg = loadImage("icons/c.png");
  dimg = loadImage("icons/d.png");
  eimg = loadImage("icons/e.png");
  fimg = loadImage("icons/f.png");
  gimg = loadImage("icons/g.png");
  aimg = loadImage("icons/a.png");
  bimg = loadImage("icons/b.png");
  c2img = loadImage("icons/c2.png");
  
  //piano note files
  noteC = minim.loadFile("piano/c.mp3");
  noteD = minim.loadFile("piano/d.mp3");
  noteE = minim.loadFile("piano/e.mp3");
  noteF = minim.loadFile("piano/f.mp3");
  noteG = minim.loadFile("piano/g.mp3");
  noteA = minim.loadFile("piano/a.mp3");
  noteB = minim.loadFile("piano/b.mp3");
  noteC2 = minim.loadFile("piano/c2.mp3");
  
  //violin note files
  VnoteC = minim.loadFile("violin/c.mp3");
  VnoteD = minim.loadFile("violin/d.mp3");
  VnoteE = minim.loadFile("violin/e.mp3");
  VnoteF = minim.loadFile("violin/f.mp3");
  VnoteG = minim.loadFile("violin/g.mp3");
  VnoteA = minim.loadFile("violin/a.mp3");
  VnoteB = minim.loadFile("violin/b.mp3");
  VnoteC2 = minim.loadFile("violin/c2.mp3");
  
  //violin note files
  XnoteC = minim.loadFile("xylophone/c.wav");
  XnoteD = minim.loadFile("xylophone/d.wav");
  XnoteE = minim.loadFile("xylophone/e.wav");
  XnoteF = minim.loadFile("xylophone/f.wav");
  XnoteG = minim.loadFile("xylophone/g.wav");
  XnoteA = minim.loadFile("xylophone/a.wav");
  XnoteB = minim.loadFile("xylophone/b.wav");
  XnoteC2 = minim.loadFile("xylophone/c2.wav");


  // initialize the pose object
  getPose();
  strokeWeight(5);
  
}

void getPose() {
  
  poseC = new SkeletonPoser(kinect);
  poseD = new SkeletonPoser(kinect);
  poseE = new SkeletonPoser(kinect);
  poseF = new SkeletonPoser(kinect);
  poseG = new SkeletonPoser(kinect);
  poseA = new SkeletonPoser(kinect);
  poseB = new SkeletonPoser(kinect);
  poseC2 = new SkeletonPoser(kinect);
  poseChange =  new SkeletonPoser(kinect);

  //POSE C
  //RIGHT ARM
  poseC.addRule(SimpleOpenNI.SKEL_RIGHT_HAND, PoseRule.ABOVE, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  poseC.addRule(SimpleOpenNI.SKEL_RIGHT_HAND, PoseRule.RIGHT_OF, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  poseC.addRule(SimpleOpenNI.SKEL_RIGHT_ELBOW, PoseRule.ABOVE, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  poseC.addRule(SimpleOpenNI.SKEL_RIGHT_ELBOW, PoseRule.RIGHT_OF, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  // LEFT ARM
  poseC.addRule(SimpleOpenNI.SKEL_LEFT_ELBOW, PoseRule.BELOW, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  poseC.addRule(SimpleOpenNI.SKEL_LEFT_ELBOW, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  poseC.addRule(SimpleOpenNI.SKEL_LEFT_HAND, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_LEFT_ELBOW);
  poseC.addRule(SimpleOpenNI.SKEL_LEFT_HAND, PoseRule.BELOW, SimpleOpenNI.SKEL_LEFT_ELBOW);
  // RIGHT LEG
  poseC.addRule(SimpleOpenNI.SKEL_RIGHT_KNEE, PoseRule.BELOW, SimpleOpenNI.SKEL_RIGHT_HIP);
  poseC.addRule(SimpleOpenNI.SKEL_RIGHT_FOOT, PoseRule.BELOW, SimpleOpenNI.SKEL_RIGHT_KNEE);
  poseC.addRule(SimpleOpenNI.SKEL_RIGHT_FOOT, PoseRule.BELOW, SimpleOpenNI.SKEL_LEFT_KNEE);
  //LEFT LEG
  poseC.addRule(SimpleOpenNI.SKEL_LEFT_KNEE, PoseRule.BELOW, SimpleOpenNI.SKEL_LEFT_HIP);
  poseC.addRule(SimpleOpenNI.SKEL_LEFT_FOOT, PoseRule.BELOW, SimpleOpenNI.SKEL_LEFT_KNEE);
  poseC.addRule(SimpleOpenNI.SKEL_LEFT_FOOT, PoseRule.BELOW, SimpleOpenNI.SKEL_RIGHT_KNEE);

  //POSE D
  //RIGHT ARM
  poseD.addRule(SimpleOpenNI.SKEL_RIGHT_HAND, PoseRule.BELOW, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  poseD.addRule(SimpleOpenNI.SKEL_RIGHT_HAND, PoseRule.RIGHT_OF, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  poseD.addRule(SimpleOpenNI.SKEL_RIGHT_ELBOW, PoseRule.BELOW, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  poseD.addRule(SimpleOpenNI.SKEL_RIGHT_ELBOW, PoseRule.RIGHT_OF, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  // LEFT ARM
  poseD.addRule(SimpleOpenNI.SKEL_LEFT_ELBOW, PoseRule.ABOVE, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  poseD.addRule(SimpleOpenNI.SKEL_LEFT_ELBOW, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  poseD.addRule(SimpleOpenNI.SKEL_LEFT_HAND, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_LEFT_ELBOW);
  poseD.addRule(SimpleOpenNI.SKEL_LEFT_HAND, PoseRule.ABOVE, SimpleOpenNI.SKEL_LEFT_ELBOW);
  // RIGHT LEG
  poseD.addRule(SimpleOpenNI.SKEL_RIGHT_KNEE, PoseRule.BELOW, SimpleOpenNI.SKEL_RIGHT_HIP);
  poseD.addRule(SimpleOpenNI.SKEL_RIGHT_FOOT, PoseRule.BELOW, SimpleOpenNI.SKEL_RIGHT_KNEE);
  poseD.addRule(SimpleOpenNI.SKEL_RIGHT_FOOT, PoseRule.BELOW, SimpleOpenNI.SKEL_LEFT_KNEE);
  //LEFT LEG
  poseD.addRule(SimpleOpenNI.SKEL_LEFT_KNEE, PoseRule.BELOW, SimpleOpenNI.SKEL_LEFT_HIP);
  poseD.addRule(SimpleOpenNI.SKEL_LEFT_FOOT, PoseRule.BELOW, SimpleOpenNI.SKEL_LEFT_KNEE);
  poseD.addRule(SimpleOpenNI.SKEL_LEFT_FOOT, PoseRule.BELOW, SimpleOpenNI.SKEL_RIGHT_KNEE);
  
  //POSE E
  //RIGHT ARM
  poseE.addRule(SimpleOpenNI.SKEL_RIGHT_HAND, PoseRule.ABOVE, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  poseE.addRule(SimpleOpenNI.SKEL_RIGHT_HAND, PoseRule.RIGHT_OF, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  poseE.addRule(SimpleOpenNI.SKEL_RIGHT_ELBOW, PoseRule.ABOVE, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  poseE.addRule(SimpleOpenNI.SKEL_RIGHT_ELBOW, PoseRule.RIGHT_OF, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  // LEFT ARM
  poseE.addRule(SimpleOpenNI.SKEL_LEFT_ELBOW, PoseRule.ABOVE, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  poseE.addRule(SimpleOpenNI.SKEL_LEFT_ELBOW, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  poseE.addRule(SimpleOpenNI.SKEL_LEFT_HAND, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_LEFT_ELBOW);
  poseE.addRule(SimpleOpenNI.SKEL_LEFT_HAND, PoseRule.ABOVE, SimpleOpenNI.SKEL_LEFT_ELBOW);
  // RIGHT LEG
  poseE.addRule(SimpleOpenNI.SKEL_RIGHT_KNEE, PoseRule.BELOW, SimpleOpenNI.SKEL_RIGHT_HIP);
  poseE.addRule(SimpleOpenNI.SKEL_RIGHT_FOOT, PoseRule.BELOW, SimpleOpenNI.SKEL_RIGHT_KNEE);
  poseE.addRule(SimpleOpenNI.SKEL_RIGHT_FOOT, PoseRule.BELOW, SimpleOpenNI.SKEL_LEFT_KNEE);
  //LEFT LEG
  poseE.addRule(SimpleOpenNI.SKEL_LEFT_KNEE, PoseRule.BELOW, SimpleOpenNI.SKEL_LEFT_HIP);
  poseE.addRule(SimpleOpenNI.SKEL_LEFT_FOOT, PoseRule.BELOW, SimpleOpenNI.SKEL_LEFT_KNEE);
  poseE.addRule(SimpleOpenNI.SKEL_LEFT_FOOT, PoseRule.BELOW, SimpleOpenNI.SKEL_RIGHT_KNEE);
  
  //POSE F
  //RIGHT ARM
  poseF.addRule(SimpleOpenNI.SKEL_RIGHT_HAND, PoseRule.ABOVE, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  poseF.addRule(SimpleOpenNI.SKEL_RIGHT_HAND, PoseRule.RIGHT_OF, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  poseF.addRule(SimpleOpenNI.SKEL_RIGHT_HAND, PoseRule.RIGHT_OF, SimpleOpenNI.SKEL_RIGHT_FOOT);
  poseF.addRule(SimpleOpenNI.SKEL_RIGHT_ELBOW, PoseRule.ABOVE, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  poseF.addRule(SimpleOpenNI.SKEL_RIGHT_ELBOW, PoseRule.RIGHT_OF, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  // LEFT ARM
  poseF.addRule(SimpleOpenNI.SKEL_LEFT_ELBOW, PoseRule.ABOVE, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  poseF.addRule(SimpleOpenNI.SKEL_LEFT_HAND, PoseRule.RIGHT_OF, SimpleOpenNI.SKEL_RIGHT_FOOT);
  poseF.addRule(SimpleOpenNI.SKEL_LEFT_HAND, PoseRule.RIGHT_OF, SimpleOpenNI.SKEL_LEFT_ELBOW);
  poseF.addRule(SimpleOpenNI.SKEL_LEFT_HAND, PoseRule.ABOVE, SimpleOpenNI.SKEL_LEFT_ELBOW);
  // RIGHT LEG
  poseF.addRule(SimpleOpenNI.SKEL_RIGHT_KNEE, PoseRule.BELOW, SimpleOpenNI.SKEL_RIGHT_HIP);
  poseF.addRule(SimpleOpenNI.SKEL_RIGHT_FOOT, PoseRule.BELOW, SimpleOpenNI.SKEL_RIGHT_KNEE);
  poseF.addRule(SimpleOpenNI.SKEL_RIGHT_FOOT, PoseRule.BELOW, SimpleOpenNI.SKEL_LEFT_KNEE);
  //LEFT LEG
  poseF.addRule(SimpleOpenNI.SKEL_LEFT_KNEE, PoseRule.BELOW, SimpleOpenNI.SKEL_LEFT_HIP);
  poseF.addRule(SimpleOpenNI.SKEL_LEFT_FOOT, PoseRule.BELOW, SimpleOpenNI.SKEL_LEFT_KNEE);
  poseF.addRule(SimpleOpenNI.SKEL_LEFT_FOOT, PoseRule.BELOW, SimpleOpenNI.SKEL_RIGHT_KNEE);
  
  //POSE G
  //RIGHT ARM
  poseG.addRule(SimpleOpenNI.SKEL_RIGHT_HAND, PoseRule.ABOVE, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  poseG.addRule(SimpleOpenNI.SKEL_RIGHT_HAND, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  poseG.addRule(SimpleOpenNI.SKEL_RIGHT_HAND, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_LEFT_FOOT);
  poseG.addRule(SimpleOpenNI.SKEL_RIGHT_ELBOW, PoseRule.ABOVE, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  // LEFT ARM
  poseG.addRule(SimpleOpenNI.SKEL_LEFT_ELBOW, PoseRule.ABOVE, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  poseG.addRule(SimpleOpenNI.SKEL_LEFT_ELBOW, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  poseG.addRule(SimpleOpenNI.SKEL_LEFT_HAND, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_LEFT_FOOT);
  poseG.addRule(SimpleOpenNI.SKEL_LEFT_HAND, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_LEFT_ELBOW);
  poseG.addRule(SimpleOpenNI.SKEL_LEFT_HAND, PoseRule.ABOVE, SimpleOpenNI.SKEL_LEFT_ELBOW);
  // RIGHT LEG
  poseG.addRule(SimpleOpenNI.SKEL_RIGHT_KNEE, PoseRule.BELOW, SimpleOpenNI.SKEL_RIGHT_HIP);
  poseG.addRule(SimpleOpenNI.SKEL_RIGHT_FOOT, PoseRule.BELOW, SimpleOpenNI.SKEL_RIGHT_KNEE);
  poseG.addRule(SimpleOpenNI.SKEL_RIGHT_FOOT, PoseRule.BELOW, SimpleOpenNI.SKEL_LEFT_KNEE);
  //LEFT LEG
  poseG.addRule(SimpleOpenNI.SKEL_LEFT_KNEE, PoseRule.BELOW, SimpleOpenNI.SKEL_LEFT_HIP);
  poseG.addRule(SimpleOpenNI.SKEL_LEFT_FOOT, PoseRule.BELOW, SimpleOpenNI.SKEL_LEFT_KNEE);
  poseG.addRule(SimpleOpenNI.SKEL_LEFT_FOOT, PoseRule.BELOW, SimpleOpenNI.SKEL_RIGHT_KNEE);
  
  //POSE A
  //RIGHT ARM
  poseA.addRule(SimpleOpenNI.SKEL_RIGHT_HAND, PoseRule.BELOW, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  poseA.addRule(SimpleOpenNI.SKEL_RIGHT_ELBOW, PoseRule.BELOW, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  // LEFT ARM
  poseA.addRule(SimpleOpenNI.SKEL_LEFT_ELBOW, PoseRule.BELOW, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  poseA.addRule(SimpleOpenNI.SKEL_LEFT_HAND, PoseRule.BELOW, SimpleOpenNI.SKEL_LEFT_ELBOW);
  // RIGHT LEG
  poseA.addRule(SimpleOpenNI.SKEL_RIGHT_KNEE, PoseRule.BELOW, SimpleOpenNI.SKEL_RIGHT_HIP);
  poseA.addRule(SimpleOpenNI.SKEL_RIGHT_FOOT, PoseRule.RIGHT_OF, SimpleOpenNI.SKEL_RIGHT_KNEE);
  poseA.addRule(SimpleOpenNI.SKEL_RIGHT_FOOT, PoseRule.ABOVE, SimpleOpenNI.SKEL_LEFT_KNEE);
  poseA.addRule(SimpleOpenNI.SKEL_RIGHT_FOOT, PoseRule.ABOVE, SimpleOpenNI.SKEL_LEFT_FOOT);
  //LEFT LEG
  poseA.addRule(SimpleOpenNI.SKEL_LEFT_KNEE, PoseRule.BELOW, SimpleOpenNI.SKEL_LEFT_HIP);
  poseA.addRule(SimpleOpenNI.SKEL_LEFT_FOOT, PoseRule.BELOW, SimpleOpenNI.SKEL_LEFT_KNEE);
  poseA.addRule(SimpleOpenNI.SKEL_LEFT_FOOT, PoseRule.BELOW, SimpleOpenNI.SKEL_RIGHT_KNEE);
  
  //POSE B
  //RIGHT ARM
  poseB.addRule(SimpleOpenNI.SKEL_RIGHT_HAND, PoseRule.BELOW, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  poseB.addRule(SimpleOpenNI.SKEL_RIGHT_ELBOW, PoseRule.BELOW, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  // LEFT ARM
  poseB.addRule(SimpleOpenNI.SKEL_LEFT_ELBOW, PoseRule.BELOW, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  poseB.addRule(SimpleOpenNI.SKEL_LEFT_HAND, PoseRule.BELOW, SimpleOpenNI.SKEL_LEFT_ELBOW);
  // RIGHT LEG
  poseB.addRule(SimpleOpenNI.SKEL_RIGHT_KNEE, PoseRule.BELOW, SimpleOpenNI.SKEL_RIGHT_HIP);
  poseB.addRule(SimpleOpenNI.SKEL_RIGHT_FOOT, PoseRule.BELOW, SimpleOpenNI.SKEL_RIGHT_KNEE);
  poseB.addRule(SimpleOpenNI.SKEL_RIGHT_FOOT, PoseRule.BELOW, SimpleOpenNI.SKEL_LEFT_KNEE);
  //LEFT LEG
  poseB.addRule(SimpleOpenNI.SKEL_LEFT_KNEE, PoseRule.BELOW, SimpleOpenNI.SKEL_LEFT_HIP);
  poseB.addRule(SimpleOpenNI.SKEL_LEFT_FOOT, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_LEFT_KNEE);
  poseB.addRule(SimpleOpenNI.SKEL_LEFT_FOOT, PoseRule.ABOVE, SimpleOpenNI.SKEL_RIGHT_FOOT);
  poseB.addRule(SimpleOpenNI.SKEL_LEFT_FOOT, PoseRule.ABOVE, SimpleOpenNI.SKEL_RIGHT_KNEE);
  
  //POSE C2
  //RIGHT ARM
  poseC2.addRule(SimpleOpenNI.SKEL_RIGHT_HAND, PoseRule.ABOVE, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  poseC2.addRule(SimpleOpenNI.SKEL_RIGHT_HAND, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  poseC2.addRule(SimpleOpenNI.SKEL_RIGHT_ELBOW, PoseRule.ABOVE, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  poseC2.addRule(SimpleOpenNI.SKEL_RIGHT_ELBOW, PoseRule.RIGHT_OF, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  poseC2.addRule(SimpleOpenNI.SKEL_RIGHT_HAND, PoseRule.ABOVE, SimpleOpenNI.SKEL_HEAD);
  // LEFT ARM
  poseC2.addRule(SimpleOpenNI.SKEL_LEFT_ELBOW, PoseRule.ABOVE, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  poseC2.addRule(SimpleOpenNI.SKEL_LEFT_ELBOW, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  poseC2.addRule(SimpleOpenNI.SKEL_LEFT_HAND, PoseRule.RIGHT_OF, SimpleOpenNI.SKEL_LEFT_ELBOW);
  poseC2.addRule(SimpleOpenNI.SKEL_LEFT_HAND, PoseRule.ABOVE, SimpleOpenNI.SKEL_LEFT_ELBOW);
  poseC2.addRule(SimpleOpenNI.SKEL_RIGHT_HAND, PoseRule.ABOVE, SimpleOpenNI.SKEL_HEAD);
  // RIGHT LEG
  poseC2.addRule(SimpleOpenNI.SKEL_RIGHT_KNEE, PoseRule.BELOW, SimpleOpenNI.SKEL_RIGHT_HIP);
  poseC2.addRule(SimpleOpenNI.SKEL_RIGHT_KNEE, PoseRule.RIGHT_OF, SimpleOpenNI.SKEL_RIGHT_HIP);
  poseC2.addRule(SimpleOpenNI.SKEL_RIGHT_FOOT, PoseRule.BELOW, SimpleOpenNI.SKEL_RIGHT_KNEE);
  poseC2.addRule(SimpleOpenNI.SKEL_RIGHT_FOOT, PoseRule.BELOW, SimpleOpenNI.SKEL_LEFT_KNEE);
  poseC2.addRule(SimpleOpenNI.SKEL_RIGHT_FOOT, PoseRule.RIGHT_OF, SimpleOpenNI.SKEL_RIGHT_KNEE);
  
  //LEFT LEG
  poseC2.addRule(SimpleOpenNI.SKEL_LEFT_KNEE, PoseRule.BELOW, SimpleOpenNI.SKEL_LEFT_HIP);
  poseC2.addRule(SimpleOpenNI.SKEL_LEFT_KNEE, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_LEFT_HIP);
  poseC2.addRule(SimpleOpenNI.SKEL_LEFT_FOOT, PoseRule.BELOW, SimpleOpenNI.SKEL_LEFT_KNEE);
  poseC2.addRule(SimpleOpenNI.SKEL_LEFT_FOOT, PoseRule.BELOW, SimpleOpenNI.SKEL_RIGHT_KNEE);
  poseC2.addRule(SimpleOpenNI.SKEL_LEFT_FOOT, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_LEFT_KNEE);
  
  //POSEINSTRUMENT CHANGE
  //RIGHT ARM
  poseChange.addRule(SimpleOpenNI.SKEL_RIGHT_HAND, PoseRule.BELOW, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  poseChange.addRule(SimpleOpenNI.SKEL_RIGHT_HAND, PoseRule.RIGHT_OF, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  poseChange.addRule(SimpleOpenNI.SKEL_RIGHT_ELBOW, PoseRule.BELOW, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  poseChange.addRule(SimpleOpenNI.SKEL_RIGHT_ELBOW, PoseRule.RIGHT_OF, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  // LEFT ARM
  poseChange.addRule(SimpleOpenNI.SKEL_LEFT_ELBOW, PoseRule.BELOW, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  poseChange.addRule(SimpleOpenNI.SKEL_LEFT_ELBOW, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  poseChange.addRule(SimpleOpenNI.SKEL_LEFT_HAND, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_LEFT_ELBOW);
  poseChange.addRule(SimpleOpenNI.SKEL_LEFT_HAND, PoseRule.BELOW, SimpleOpenNI.SKEL_LEFT_ELBOW);
  // RIGHT LEG
  poseChange.addRule(SimpleOpenNI.SKEL_RIGHT_FOOT, PoseRule.BELOW, SimpleOpenNI.SKEL_RIGHT_KNEE);
  poseChange.addRule(SimpleOpenNI.SKEL_RIGHT_FOOT, PoseRule.BELOW, SimpleOpenNI.SKEL_LEFT_KNEE);
  poseChange.addRule(SimpleOpenNI.SKEL_RIGHT_FOOT, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_RIGHT_KNEE);
  poseChange.addRule(SimpleOpenNI.SKEL_RIGHT_FOOT, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_LEFT_FOOT);
  //LEFT LEG
  poseChange.addRule(SimpleOpenNI.SKEL_LEFT_FOOT, PoseRule.BELOW, SimpleOpenNI.SKEL_LEFT_KNEE);
  poseChange.addRule(SimpleOpenNI.SKEL_LEFT_FOOT, PoseRule.BELOW, SimpleOpenNI.SKEL_RIGHT_KNEE);
  poseChange.addRule(SimpleOpenNI.SKEL_LEFT_FOOT, PoseRule.RIGHT_OF, SimpleOpenNI.SKEL_LEFT_KNEE);
  poseChange.addRule(SimpleOpenNI.SKEL_LEFT_FOOT, PoseRule.RIGHT_OF, SimpleOpenNI.SKEL_RIGHT_FOOT);
  
  return;
}

void draw() {
  background(0);
  kinect.update();

  IntVector userList = new IntVector();
  kinect.getUsers(userList);
  if (userList.size() > 0) {
    int userId = userList.get(0);
    
    if(instrument==0){
      image(pianoimg, 15,10);
    }
    if(instrument==1){
      image(violinimg, 15,10);
    }
    if(instrument==2){
      image(xyloimg,15,10);
    }
    
    //guides
      image(cimg,565,9);
      image(dimg,565,68);
      image(eimg,565,127);
      image(fimg,565,186);
      image(gimg,565,245);
      image(aimg,565,304);
      image(bimg,565,363);
      image(c2img,565,422);
    
    //for (int i = 0; i < userList.size (); i++) {

    
    if ( kinect.isTrackingSkeleton(userId)) {
      
      // if pose C
      if (poseC.check(userId)) {
        //red
        stroke(255);
        background(255,89,66);
        //play note
        if (instrument==0){
        noteC.play();
        }
        if (instrument==1){
        VnoteC.play();
        }
        if (instrument==2){
        XnoteC.play();
        }
        println("pose C");
      }
      
      //if pose d
      else if (poseD.check(userId)) {
        //orange
        stroke(255);
        background(255,142,66);
        //play note
        if (instrument==0){
        noteD.play();
        }
        if (instrument==1){
        VnoteD.play();
        }
        if (instrument==2){
        XnoteD.play();
        }
        println("pose D");
      }
      
      //if pose e
      else if (poseE.check(userId)) {
        //yellow
        stroke(255);
        background(255,190,70);
        //play note
        if (instrument==0){
        noteE.play();
        }
        if (instrument==1){
        VnoteE.play();
        }
        if (instrument==2){
        XnoteE.play();
        }
        println("pose E");
      }
      
      //if pose f
      else if (poseF.check(userId)) {
        //green
        stroke(255);
        background(98,171,103);
        // play note
        if (instrument==0){
        noteF.play();
        }
        if (instrument==1){
        VnoteF.play();
        }
        if (instrument==2){
        XnoteF.play();
        }
      println("pose F");
      }
      
      //if pose g
      else if (poseG.check(userId)) {
        //lt blue
        stroke(255);
        background(104,214,255);
        //play note
        if (instrument==0){
        noteG.play();
        }
        if (instrument==1){
        VnoteG.play();
        }
        if (instrument==2){
        XnoteG.play();
        }
        println("pose G");
      }   
      
      //if pose A
      else if (poseA.check(userId)) {
        //dk blue
        stroke(255);
        background(24,137,235);
        //play note
        if (instrument==0){
        noteA.play();
        }
        if (instrument==1){
        VnoteA.play();
        }
        if (instrument==2){
        XnoteA.play();
        }
        println("pose A");
      }   
      
      //if pose B
      else if (poseB.check(userId)) {
        //purple
        stroke(255);
        background(211,156,255);
        //play note
        if (instrument==0){
        noteB.play();
        }
        if (instrument==1){
        VnoteB.play();
        }
        if (instrument==2){
        XnoteB.play();
        }
        println("pose B");
      }   
      
      //if pose C2
      else if (poseC2.check(userId)) {
        //pink
        stroke(255);
        background(244,137,235);
        //play note
        if (instrument==0){
        noteC2.play();
        }
        if (instrument==1){
        VnoteC2.play();
        }
        if (instrument==2){
        XnoteC2.play();
        }
        println("pose C2");
      }  
      
      //if pose change
      else if (poseChange.check(userId)) {
      //rainbow bg
      stroke(255);
      fill(255,89,66);//red
      rect(0,0,80,height);
      fill(255,142,66);//orange
      rect(80,0,80,height);
      fill(255,190,70);//yellow
      rect(160,0,80,height);
      fill(98,171,103);//green
      rect(240,0,80,height);
      fill(104,214,255);//lt blue
      rect(320,0,80,height);
      fill(24,137,235);//dk blue
      rect(400,0,80,height);
      fill(211,156,255);//purp
      rect(480,0,80,height);
      fill(244,137,235);//pink
      rect(560,0,80,height);
      println("pose instrument change");
      if (instrument==2){
        instrument=0;
      }
      else{
        instrument++;
        println(instrument);
      }
      }
      
      else{
        noteC.pause();
        noteC.rewind();
        noteD.pause();
        noteD.rewind();
        noteE.pause();
        noteE.rewind();
        noteF.pause();
        noteF.rewind();
        noteG.pause();
        noteG.rewind();
        noteA.pause();
        noteA.rewind();
        noteB.pause();
        noteB.rewind();
        noteC2.pause();
        noteC2.rewind();
        VnoteC.pause();
        VnoteC.rewind();
        VnoteD.pause();
        VnoteD.rewind();
        VnoteE.pause();
        VnoteE.rewind();
        VnoteF.pause();
        VnoteF.rewind();
        VnoteG.pause();
        VnoteG.rewind();
        VnoteA.pause();
        VnoteA.rewind();
        VnoteB.pause();
        VnoteB.rewind();
        VnoteC2.pause();
        VnoteC2.rewind();
        XnoteC.pause();
        XnoteC.rewind();
        XnoteD.pause();
        XnoteD.rewind();
        XnoteE.pause();
        XnoteE.rewind();
        XnoteF.pause();
        XnoteF.rewind();
        XnoteG.pause();
        XnoteG.rewind();
        XnoteA.pause();
        XnoteA.rewind();
        XnoteB.pause();
        XnoteB.rewind();
        XnoteC2.pause();
        XnoteC2.rewind();
      }
      
    } 
    else {
    // set to white
    stroke(255);
  }

  // draw the skeleton in whatever color we chose
  drawSkeleton(userId);
  //}
  }
}




void drawSkeleton(int userId) {
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_HEAD, SimpleOpenNI.SKEL_NECK);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_NECK, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER, SimpleOpenNI.SKEL_LEFT_ELBOW);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_ELBOW, SimpleOpenNI.SKEL_LEFT_HAND);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_NECK, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_ELBOW, SimpleOpenNI.SKEL_RIGHT_HAND);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER, SimpleOpenNI.SKEL_TORSO);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER, SimpleOpenNI.SKEL_TORSO);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_TORSO, SimpleOpenNI.SKEL_LEFT_HIP);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_HIP, SimpleOpenNI.SKEL_LEFT_KNEE);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_KNEE, SimpleOpenNI.SKEL_LEFT_FOOT);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_TORSO, SimpleOpenNI.SKEL_RIGHT_HIP);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_HIP, SimpleOpenNI.SKEL_RIGHT_KNEE);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_KNEE, SimpleOpenNI.SKEL_RIGHT_FOOT);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_HIP, SimpleOpenNI.SKEL_LEFT_HIP);
}

void drawLimb(int userId, int jointType1, int jointType2)
{
  PVector jointPos1 = new PVector();
  PVector jointPos2 = new PVector();
  float confidence;

  // draw the joint position
  confidence = kinect.getJointPositionSkeleton(userId, jointType1, jointPos1);
  confidence = kinect.getJointPositionSkeleton(userId, jointType2, jointPos2);

  line(jointPos1.x, jointPos1.y, jointPos1.z, 
  jointPos2.x, jointPos2.y, jointPos2.z);
}

void keyPressed() 
{
  saveFrame("project"+random(100)+".png");
}


// user-tracking callbacks!
void onNewUser(SimpleOpenNI curContext, int userId)
{
  println("onNewUser - userId: " + userId);
  println("start tracking skeleton");
  kinect.startTrackingSkeleton(userId);
}

void onLostUser(SimpleOpenNI curContext, int userId)
{
  println("onLostUser - userId: " + userId);
}

void onVisibleUser(SimpleOpenNI curContext, int userId)
{
  println("onVisibleUser - userId: " + userId);
}