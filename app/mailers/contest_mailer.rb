class ContestMailer < ActionMailer::Base
  default :from => "CMU Summit <info@cmusummit.org>"
  default :to => 'cmu.competition@gmail.com'
  default :bcc => %w(cmusummit@huangtao.me libragold+cmusummit@gmail.com)

  def submit_executive_summary(submission)
    @submission = submission
    attachments[@submission.file.original_filename] = @submission.file.read
    mail(:subject => "[New Submission] Executive Summary submission for CMU Summit")
  end
end
