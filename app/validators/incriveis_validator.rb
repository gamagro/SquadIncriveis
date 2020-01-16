class IncriveisValidator < ActiveModel::Validator
    def validate(record)
        if record.pf_pj == "PF"
            if !BRDocuments::CPF.valid?(record.cpf)
                record.errors[:cpf] << "inválido."
            end
            if record.fullname == ""
                record.errors[:fullname] << "não pode ser nulo."
            end
            if record.fullname.length > 50
                record.errors[:fullname] << "deve possuir menos que 51 caracteres."
            end
            if !record.fullname.match(/\A[[:alpha:][:blank:]]+\z/)
                record.errors[:fullname] << "deve conter apenas letras e espaços."
            end
            record.cnpj = nil
            record.razaosocial = nil
        elsif record.pf_pj == "PJ"
            if !BRDocuments::CNPJ.valid?(record.cnpj)
                record.errors[:cnpj] << "inválido."
            end
            if record.razaosocial == ""
                record.errors[:razaosocial] << "não pode ser nulo."
            end
            if record.cep == ""
                record.errors[:cep] << "não pode ser nulo."
            end 
            record.cpf = nil
            record.fullname = nil
        end

        if record.password && !record.password.match(/(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*\W+).*$/)
            record.errors[:password] << "deve conter um caractere especial, uma letra maiúscula, uma letra minúscula e um número."
        end

        if !record.email.match(/\A[^@\s]+@youse.com.br/);
            record.errors[:email] << "deve ser no formato 'exemplo@youse.com.br'."
        end
        if record.pf_pj == ""
            record.errors[:pf_pj] << "Selecione o tipo de pessoa"
        end
    end 
end 

