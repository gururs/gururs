class EventsController < InheritedResources::Base
  actions :index, :show

  protected

  def collection
    @events ||= end_of_association_chain.order('happens_at DESC')
  end
end
