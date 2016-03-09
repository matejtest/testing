class Image < ActiveRecord::Base

	has_attached_file :image, styles: { small: "64x64", medium: "300x300>", large: "500x500>" }, default_url: "/images/:style/missing.png"

	# validates :image, :attachment_presence => true
	# validates_attachment :image, :size => { :in => 0..10000.kilobytes }
	# validates_attachment :image, :content_type => { :content_type => "image/jpg" }

	validates_attachment :image, :presence => true, :content_type => { :content_type => /\Aimage\/.*\Z/ }, :size => { :in => 0..10000.kilobytes }



end
