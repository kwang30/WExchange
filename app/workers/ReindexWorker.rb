class SearchWorker
  include Sidekiq::Worker

  def perform(parent_class, parent_id, target_class)
    User.
    # parent_class i.e., "Author"
    # target_class i.e., "Book"
    # desired result: parent_class.target_classes, i.e. Author.find(parent_id).books
    model = parent_class.classify.constantize # converts "Author" & "author"
           # to Author (as a class)
    association = target_class.tableize # converts "Book" & "book" to "books"
           # (as a string, use send to invoke the method)
    model.find(parent_id.to_i).send(association).find_in_batches do |batch|
       target_class.classify.constantize.searchkick_index.import(batch)
# I.E. Book.searchkick_index.import(batch_of_books)
    end
  end


end
