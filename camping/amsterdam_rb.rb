%w(rubygems camping).map{|v| require v}

Camping.goes :AmsterdamRb

module AmsterdamRb
  module Controllers
    class Index < R '/'
      def get
        render :index
      end
    end
  end

  module Views
    def layout
      html(:lang => 'en') do
        head do
          title 'Amsterdam.rb'
          meta :name => 'keywords', :content => 'Amsterdam Netherlands Ruby User Group Meetings Social Coding Beer'
          meta :name => 'description', :content => 'Amsterdam.rb: Ruby User Group'
        end
        body do
          h1 'Amsterdam.rb'

          self << yield
        end
      end
    end

    def index
      h2 "Amsterdam's Ruby User Group"
      p %Q{
        We are the Amsterdam Ruby User Group. We exist to promote all aspects
        of Ruby within the area of Amsterdam.
      }
      p %Q{
        Our aim is to make Amsterdam a centre of excellence for Ruby
        development.
      }
      p %Q{
        We meet on the last Monday of every month, and welcome anybody with an
        interest in the language Ruby, or even the framework Rails. We
        particularly welcome newcomers to join our friendly local community to
        share, teach and generate new Ruby knowledge.
      }

      h2 'Next Meeting'
      p do
        text '8pm on '
        text next_last_monday_of_the_month.to_s(:long)
        text ' @ '
        a "De bekeerde suster", :href => "http://www.debekeerdesuster.nl/"
      end

      p do
        google_map
      end

      h2 "Join Our Community"
      p do
        text "Subscribe to our "
        a "mailing list", :href => "http://groups.google.com/group/amsterdam-rb"
      end
      form :action => "http://groups.google.com/group/amsterdam-rb/boxsubscribe" do
        input :type => "text", :name => "email", :value => "enter email address"
        input :type => "submit", :name => "sub", :value => "Subscribe"
      end

      flicker_badge
    end

    def next_last_monday_of_the_month(start = Date.today)
      t, m, l = start, start.month, nil

      loop do
        l = t if t.wday == 1 # monday
        t += 1.day

        if m != t.month
          break if l
          m = t.month
        end
      end
    
      l.to_date
    end

    def google_map
      p do
        self << %q{
          <iframe width="425" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.com/maps?f=q&amp;hl=en&amp;geocode=&amp;time=&amp;date=&amp;ttype=&amp;q=Kloveniersburgwal+6,+Amsterdam&amp;sll=37.0625,-95.677068&amp;sspn=40.817312,76.904297&amp;ie=UTF8&amp;z=14&amp;iwloc=addr&amp;om=0&amp;ll=52.378219,4.903593&amp;output=embed&amp;s=AARTsJomp73jyUYd_ds0InN1MEBW0AbMXA"></iframe><br />
          <small><a href="http://maps.google.com/maps?f=q&amp;hl=en&amp;geocode=&amp;time=&amp;date=&amp;ttype=&amp;q=Kloveniersburgwal+6,+Amsterdam&amp;sll=37.0625,-95.677068&amp;sspn=40.817312,76.904297&amp;ie=UTF8&amp;z=14&amp;iwloc=addr&amp;om=0&amp;ll=52.378219,4.903593&amp;source=embed" astyle="color:#0000FF;text-align:left">View Larger Map</a></small>
        }
      end
    end

    def flicker_badge
      self << %Q{
<style type="text/css">
#flickr_badge_source_txt {padding:0; font: 11px Arial, Helvetica, Sans serif; color:#666666;}
#flickr_badge_icon {display:block !important; margin:0 !important; border: 1px solid rgb(0, 0, 0) !important;}
#flickr_icon_td {padding:0 5px 0 0 !important;}
.flickr_badge_image {text-align:center !important;}
.flickr_badge_image img {border: 1px solid black !important;}
#flickr_www {display:block; text-align:left; padding:0 10px 0 10px !important; font: 11px Arial, Helvetica, Sans serif !important; color:#3993ff !important;}
#flickr_badge_uber_wrapper a:hover,
#flickr_badge_uber_wrapper a:link,
#flickr_badge_uber_wrapper a:active,
#flickr_badge_uber_wrapper a:visited {text-decoration:none !important; background:inherit !important;color:#3993ff;}
#flickr_badge_wrapper {background-color:#ffffff;border: solid 1px #000000}
#flickr_badge_source {padding:0 !important; font: 11px Arial, Helvetica, Sans serif !important; color:#666666 !important;}
</style>
<table id="flickr_badge_uber_wrapper" cellpadding="0" cellspacing="10" border="0"><tr><td><a href="http://www.flickr.com" id="flickr_www">www.<strong style="color:#3993ff">flick<span style="color:#ff1c92">r</span></strong>.com</a><table cellpadding="0" cellspacing="10" border="0" id="flickr_badge_wrapper">
<tr>
<script type="text/javascript" src="http://www.flickr.com/badge_code_v2.gne?show_name=1&count=5&display=latest&size=t&layout=h&context=in%2Fpool-amsterdam-rb%2F&source=group&group=604620%40N25"></script>
<td id="flickr_badge_source" valign="center" align="center">
<table cellpadding="0" cellspacing="0" border="0"><tr>
<td width="10" id="flickr_icon_td"><a href="http://www.flickr.com/groups/amsterdam-rb/pool/"><img id="flickr_badge_icon" alt="photos in Amsterdam.rb" src="http://www.flickr.com/images/buddyicon.jpg?604620@N25" align="left" width="48" height="48"></a></td>
<td id="flickr_badge_source_txt">More <a href="http://www.flickr.com/groups/amsterdam-rb/pool/">photos in Amsterdam.rb</a></td>
</tr></table>
</td>
</tr>
</table>
</td></tr></table>
      }
    end
  end
end
