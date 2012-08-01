class String

	def tweet_to_html
		# strip out @erlymob(_whatever)
		string = self.gsub(/\s*@erlymob_?\S*\s*/i, "")

		# linkify links
		string = string.gsub(/(https?:\/\/t\.co\/\w*)/, '<a href="\1" target="_blank">\1</a>')

		# linkify hashtags
		string = string.gsub(/(#\w+)/, '<a href="https://twitter.com/#!/search/%23\1" target="_blank">\1</a>')
		return string
	end

end
