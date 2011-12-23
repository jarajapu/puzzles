import java.util.LinkedList;

class blockingQueue {

private LinkedList<String> queue;
private boolean isEmpty ;
private int length;
final private int max = 10;

  public blockingQueue() {
   queue = new LinkedList<String>(); 
   isEmpty = true;
   length  = 0;
  }
  
  public int getLen() {
   return length;
  }

  public void addQ(String elem) {
   if(this.length == 0) 
      queue.add(elem);
    else
      queue.addFirst(elem);
   length++;
  }
  
  public String removeQ() {
   --length;
   return queue.removeLast();
  }

  public boolean maxedQ() {
   boolean ret = (length >= max);
   if (ret) 
     System.out.println("Queue maxed out, length is " + getLen());
   return ret;
  } 

  synchronized String get() {
  
      if (isEmpty)
         try {
          wait();
         } catch (InterruptedException e) {
  
          System.out.println("Interrupted while waiting to dequeue.");
         }
      
      String elem = removeQ();
 
      System.out.println("Got: " + elem );
  
      isEmpty = true;
  
      notifyAll();
  
      return elem;
  
  }

  synchronized void put (String elem) {
  
    while(maxedQ()) {
     try{
    
        wait(10);
     } catch (InterruptedException e) {
    
        System.out.println("Interrupted while waiting to enqueue.");
     }

    }
     addQ(elem);

     try {
       wait(10);
     } catch (InterruptedException e) {

       System.out.println("Interrupted while waiting for 100 ms ");
     } 
     isEmpty = false;

     System.out.println("Put:" + elem);

     notifyAll();

  
  }

}

class Producer implements Runnable {

 blockingQueue q;

 public Producer(blockingQueue q) {

   this.q = q;

   new Thread(this, "Producer").start();

 }

 public void run() {
  int i = 0;

  while(true) {
    String elem = Integer.toString(i++);
    q.put(elem);
  }

 }


}


class Consumer implements Runnable {
 
 blockingQueue q;

 public Consumer (blockingQueue q) {

  this.q = q;

  new Thread(this, "Consumer").start();

 }

 public void run() {
  
   while (true)
     q.get();

 }

}



