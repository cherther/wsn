# == Schema Information
# Schema version: 20101229224600
#
# Table name: contents
#
#  id                  :integer(4)      not null, primary key
#  catalog_id          :integer(4)      not null
#  is_controlled_allin :binary(255)     default(""), not null
#  title               :string(300)     not null
#  artist              :string(300)     not null
#  writers             :string(500)
#  pop                 :integer(4)
#  country             :integer(4)
#  release_year        :integer(4)
#  record_label        :string(300)
#  lyrics              :text
#  lyrics_index        :text
#  notes               :text
#  keywords            :text
#  similar_songs       :text
#  licensing_notes     :text
#  sounds_like         :text
#  instruments         :string(5000)
#  created_at          :datetime        not null
#  updated_at          :datetime        not null
#  created_by_user_id  :integer(4)
#  updated_by_user_id  :integer(4)
#

class Content < ActiveRecord::Base

  belongs_to :catalog
 
  has_many :media_files, :dependent => :delete_all
  has_many :representations, :dependent => :delete_all
 
  has_and_belongs_to_many :lists#, :counter_cache => true
  has_and_belongs_to_many :tags
  
  attr_accessible :title, :artist, :writers, :pop, :country, :release_year, 
  :record_label, :lyrics, :notes, :keywords, :similar_songs, :licensing_notes, :sounds_like,
  :instruments, :created_by_user_id, :updated_by_user_id
  
  
  def title_display
    displayify(title, 50)
  end
  def artist_display
    displayify(artist, 50)
  end
  def record_label_display
    displayify(record_label, 50)
  end
  
  def displayify(text, max_display)
    if text
      text = text.upcase 
      (text.length > max_display ? text.truncate(max_display, :omission => "...") : text)
    end
  end

  def self.detail(id)
    find(id, :joins => :catalog, :include => [:media_files, :tags, { :representations => :territories }])
  end
  
  def self.list_recent(page)
  
    default_sort = "contents.created_at desc"
    
    conditions =  "contents.created_at >= '" + 7.days.ago.to_date.day.to_s + "'"

    paginate :per_page => 30, 
             :page => page,
             :conditions => conditions, 
             :order => default_sort,
             :include => :catalog
  
               
  end
  
  def self.search(params, page)
    
    query = []
    values = []
    
    default_sort = "case when pop is null then 99999 else pop end, 
     case when country is null then 99999 else country end,
     case when artist is null then 'zzzzzzzzzzzzzz' else artist end,
     case when title is null then 'zzzzzzzzzzzzzz' else title end"
    sort = params[:so]
    sort_by = params[:sd]
       
    unless params[:keyword].blank?
      kw = params[:keyword].upcase
      query << "(upper(title) LIKE ? OR upper(artist) LIKE ? OR upper(lyrics_index) LIKE ? or upper(keywords) LIKE ?)" 
      values << "%" + kw + "%"
      values << "%" + kw + "%"
      values << "%" + kw + "%"
      values << "%" + kw + "%"
    end
    
    unless params[:artist].blank?
      query << "upper(artist) LIKE ?" 
      values << "%" + params[:artist].upcase + "%"
    end
    
    unless params[:billboard_pop].blank?
      query << "pop = ?" 
      values << 1  
    end
    
    unless params[:billboard_country].blank?
      query << "country = ?" 
      values << 1
    end
    
    unless params[:release_year_1].blank? 
      query << "release_year >= ?" 
      values << params[:release_year_1]
    end

    unless params[:release_year_2].blank? 
      query << "release_year <= ?" 
      values << params[:release_year_2]
    end

    unless params[:sounds_like].blank?
      query << "upper(sounds_like) LIKE ?" 
      values << "%" + params[:sounds_like].upcase + "%"
    end
    
    unless params[:instruments].blank?
      query << "upper(instruments) LIKE ?" 
      values << "%" + params[:instruments].upcase + "%"
    end
    
    unless params[:record_label].blank?
      query << "upper(record_label) LIKE ?" 
      values << "%" + params[:record_label].upcase + "%"
    end
    
    unless params[:writers].blank?
      query << "upper(writers) LIKE ?" 
      values << "%" + params[:writers].upcase + "%"
    end
    
    unless params[:record_label].blank?
      query << "upper(record_label) LIKE ?" 
      values << "%" + params[:record_label].upcase + "%"
    end
    
    unless params[:notes].blank?
      query << "upper(notes) LIKE ?" 
      values << "%" + params[:notes].upcase + "%"
    end
    
    unless params[:catalog].blank?
      query << "upper(catalog_name) LIKE ?" 
      values << "%" + params[:catalog].upcase + "%"
    end
    
    unless params[:is_controlled_allin].blank?
      query << "is_controlled_allin = 1" 
      values << "1"  
    end
    
    if query.size >= 1 then
      conditions =  [query.join(" AND ")] + values
      
#      @contents = (params[:catalog].blank? ? 
#                  Content : Content.joins(:catalog))
##                .order(default_sort)
#                .limit(page_size)
#                .offset(offset)
#                .where(conditions)
                
      paginate :per_page => 30, 
                 :page => page,
                 :conditions => conditions, 
                 :order => default_sort
    end
    
  end
end
