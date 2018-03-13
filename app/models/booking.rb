class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :experience

  before_create  :set_defaults
  after_create :send_email, :send_msg_to_slack

  validates :experience, presence: true
  validates :user,       presence: true
  validates :dates,      presence: true
  validates :adults,     presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 30}
  validates :address,    presence: true, if: :has_transfer?
  validates :name,       presence: true
  validates :phone,      presence: true
  validates :email,      presence: true

  def set_status(status, current_user)
    if current_user.admin #Se o usuário for admin executa a ação sem verificar o mapa de estados
      self.update(status: status)
      return true
    elsif current_user = self.user
      case self.status
      when 1 #PARTINDO DO ESTADO 1
        case status
        when 4
          if self.update(status: status)
            send_cancel_msg_to_slack
          end
        end
      when 2 #PARTINDO DO ESTADO 2
        case status
        when 4
          if self.update(status: status)
            send_cancel_msg_to_slack
          end
        end
      end
    end
  end

  def status_name
    case self.status
    when 1
      "Aguardando confirmação"
    when 2
      "Confirmado"
    when 3
      "Realizado"
    when 4
      "Cancelado pelo viajante"
    when 5
      "Cancelado pelo provedor da experiência"
    when 6
      "Agendamento não aceito pelo provedor de experiência"
    when 7
      "Agendamento não aprovado"
    end
  end

  def has_transfer?
    self.experience.has_transfer
  end

  def send_cancel_msg_to_slack
    slack = set_bookings_channel
    slack.post text: Slack::Notifier::Util::LinkFormatter.format("CANCELAMENTO: O usuário #{self.user.first_name} CANCELOU um agendamento do passeio #{self.experience.name}. Clique [aqui](http://montviagens.com/bookings/#{self.id}) para visualizar")
  end
  def send_msg_to_slack
		slack = set_bookings_channel
  	slack.post text: Slack::Notifier::Util::LinkFormatter.format("AGENDAMENTO: O usuário #{self.user.first_name} fez um agendamento do passeio #{self.experience.name}. Clique [aqui](http://montviagens.com/bookings/#{self.id}) para visualizar")
	end

  def send_email
    BookingMailer.send_email_to_mont(self).deliver
  end
  private
    def set_bookings_channel
      webhook = "https://hooks.slack.com/services/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"
      webhook = "https://hooks.slack.com/services/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" if Rails.env == "development" #Configura para o channel bookingstest

    return Slack::Notifier.new webhook do
        defaults username: "Booking Bot", icon_url:"http://icons.iconarchive.com/icons/custom-icon-design/pretty-office-7/48/Calendar-icon.png"
      end
    end

    def set_defaults
      self.status = 1 #AGUARDANDO CONFIRMAÇÃO
    end
end
