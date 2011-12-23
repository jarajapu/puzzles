
public class demo {

    public static void main (String[] args) {
    
    blockingQueue q = new blockingQueue();
    

    new Producer(q);
    new Producer(q);
    new Producer(q);
    
    new Consumer(q);
    new Consumer(q);
    
    }

}
