class Assistance < MailForm::Base
  attribute :name, validate: true
  attribute :email, validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :phone, validate: true
  attribute :alternatecontact, validate: true
  attribute :address, validate: true
  attribute :county, validate: true
  attribute :hearfrom, validate: true
  attribute :forwho, validate: true
  attribute :incarcerated, validate: true
  attribute :program, validate: true
  attribute :helpwith, validate: true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      subject: 'Assistance Form Inquiry',
      to: 'meljcenter@gmail.com',
      from: %("#{name}" <#{email}>)
    }
  end
end
