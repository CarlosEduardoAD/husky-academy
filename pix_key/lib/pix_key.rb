# frozen_string_literal: true

class PixKey

  def initialize(key)
    @key = key
  end

  #Verifica se a chave é válida para ser usada em uma transação Pix

  def valid?
    if !@key.nil? && !@key.empty? && @key.is_a?(String) && @key.length > 10
        return true
    else
        return false
    end
  end

  # Retorna, transforma em String e freza a string

  def value
    return @key.to_s.freeze
  end
  alias key value

  def to_s
    return @key.to_s.freeze
  end

  # Os metódos abaixo validam diversos tipos de chaves pix (email, cpf, cnpj, phone, evp)

  def phone?
    if !@key.nil? && !@key.empty?
      if @key =~ /^\+[1-9][0-9]\d{1,14}$/
        puts "Chave pix de telefone válida"
        return true
      else
        return false
      end
    end
  end

  def cpf?
    if !@key.nil? && !@key.empty?
      if @key =~ /^[0-9]{11}$/
        puts "Chave pix de cpf válida"
        return true
      else
        return false
      end
    end
  end

  def cnpj?
    if !@key.nil? && !@key.empty?
      if @key =~ /^[0-9]{14}$/
        puts "Chave pix de CNPJ válida"
        return true
      else
        return false
      end
    end
  end

  def email?
    if !@key.nil? && !@key.empty?
      if @key =~ /[a-z0-9.]+@[a-z0-9]+\.[a-z]+\.?([a-z]+)?$/
        puts "Chave pix de email válida"
        return true
      else
        return false
      end
    end
  end


  def evp?
    if !@key.empty? && !@key.nil?
      if @key =~ /[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}/
        puts "Chave pix de EVP válida"
        return true
      else
        return false
      end
    end
  end

  # Valida o tipo da chave pix de acordo com a entrada do usuário

  def type
    if !@key.nil? && !@key.empty?
      if @key =~ /[a-z0-9.]+@[a-z0-9]+\.[a-z]+\.?([a-z]+)?$/
        return "email"
      elsif @key. =~ /^[0-9]{11}$/
        return "cpf"
      elsif @key =~ /^[0-9]{14}$/
        return "cnpj"
      elsif @key =~ /^\+[1-9][0-9]\d{1,14}$/
        return "phone"
      elsif @key =~ /[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}/
        return "evp"
      else
        return "Tipo de chave inválida"
      end
    end
  end
end

