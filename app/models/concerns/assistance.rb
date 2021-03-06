class Assistance < MailForm::Base
  attribute :name, validate: true
  attribute :email, validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :phone, validate: /(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}/i
  attribute :alternatecontact, validate: true
  attribute :address, validate: true
  attribute :county, validate: true
  attribute :hearfrom, validate: true
  attribute :forwho, validate: true
  attribute :incarcerated, validate: true
  attribute :program, validate: true
  attribute :helpwith, validate: true
  attribute :money, validate: true
  attribute :bank, validate: true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      subject: 'Financial Assistance Form Inquiry',
      to: 'meljcenter@gmail.com',
      from: %("#{name}" <#{email}>)
    }
  end
end
