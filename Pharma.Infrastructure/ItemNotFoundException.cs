using System;

namespace Pharma.Infrastructure
{
    public class ItemNotFoundException<T> : Exception
    {
        public ItemNotFoundException(long id)
        {
            throw new NotImplementedException();
        }

        public ItemNotFoundException()
        {
            throw new NotImplementedException();
        }
    }
}