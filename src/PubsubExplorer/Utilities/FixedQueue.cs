using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PubsubExplorer.Utilities;

internal class FixedQueue<T>
{
    private readonly Queue<T> _queue = new Queue<T>();
    private readonly int _maxSize;

    public FixedQueue(int maxSize)
    {
        if (maxSize <= 0)
        {
            throw new ArgumentOutOfRangeException(nameof(maxSize), "Maximum size must be greater than zero.");
        }
        _maxSize = maxSize;
    }

    public void Enqueue(T item)
    {
        if (_queue.Count >= _maxSize)
        {
            _queue.Dequeue();
        }
        _queue.Enqueue(item);
    }

    public T Dequeue()
    {
        if (_queue.Count == 0)
        {
            throw new InvalidOperationException("Queue is empty.");
        }
        return _queue.Dequeue();
    }

    public T Peek()
    {
        if (_queue.Count == 0)
        {
            throw new InvalidOperationException("Queue is empty.");
        }
        return _queue.Peek();
    }

    public int Count => _queue.Count;

    public void Clear()
    {
        _queue.Clear();
    }
}
