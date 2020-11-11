# problem
# create a circular queue
  # adding a new element means adding it right behind the most recently added element
  # removing an element means removing the olders element in the queue
# when the buffer is full
  # adding a new element means removing an element --> the oldest element in the queue

# create a circular queue for 3 objects
  # the class should obtain the buffer size based on the argument provided via Class::new
  # enqueue method adds an object to the queue
  # dequeue removes and returns the oldest object in the queue
    # return nil if the queue is empty

# none of the values stored in the queue are nil, but nil is used to represent empty spots in the buffer

# data structure/algo
  # buffer --> array

  # initialize
    # take in an int (size argument)
    # initialize instance variable @buffer to a new Array equal in length to the int argument

  # enqueue
    # take in an object argument
    # check whether @buffer is full
      # if its not full, add the object to the buffer 
      # if it is full, remove the object at index 0 (oldest), shift all the objects over one, and
      # add the object to the buffer

  # add object to buffer
    # take in an object argument
    # get the index of the first nil spot
    # replace @buffer at that index with the object argument

  # dequeue
    # return the object at index 0
    # shift over all elements in @buffer


# code
class CircularQueue
  def initialize(size)
    @buffer = Array.new(size)
  end

  def enqueue(object)
    if buffer.include?(nil)
      add_object(object)
    else
      dequeue
      add_object(object)
    end
  end

  def dequeue
    self.buffer = buffer + [nil]
    buffer.shift
  end

  private

  attr_accessor :buffer

  def add_object(object)
    index = buffer.index(nil)
    buffer[index] = object
  end
end


# example(s)
queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil
