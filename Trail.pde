import java.util.Iterator;

public class Trail<T> implements Iterable {
  private int capacity;
  private Node<T> head;
  private Node<T> tail;
  private int count;
  
  public Trail(int capacity) {
    this.capacity = capacity;
    count = 0;
    head = null;
    tail = null;
  }
  
  public void add(T val) {
    Node<T> n = new Node<T>(val);
    if(count == 0) {
      head = n;
      tail = n;
      count++;
    } else if(count < capacity) {
      n.setNext(head);
      head.setPrev(n);
      head = n;
      count++;
    } else {
      n.setNext(head);
      head.setPrev(n);
      head = n;  
      tail = tail.getPrev();
      tail.setNext(null);
    }
  }
  
  public int getCapacity() {
    return capacity;
  }
  
  @Override
  public TrailIterator iterator() {
    return new TrailIterator();
  }

  public class TrailIterator implements Iterator<T> {
    private Node<T> curr;
    
    public TrailIterator() {
      curr = head;
    }
    
    public T next() {
      T v = curr.getValue();
      curr = curr.getNext();
      return v;
    }
    
    public boolean hasNext() {
      return curr != null;
    }
  }

  public class Node<E> {
    E val;
    Node<E> next;
    Node<E> prev;
    
    public Node(E value) {
      val = value;
      next = null;
      prev = null;
    }
    
    public void setNext(Node n) {
      next = n;
    }
    
    public Node getNext() {
      return next;
    }
    
    public void setPrev(Node n) {
      prev = n;
    }
    
    public Node getPrev() {
      return prev;
    }
    
    public E getValue() {
      return val;
    }
  }
}
