class IncriveisValidator < ActiveModel::Validator
    def validate(record)
        if record.pf_pj == "PF"
            if !BRDocuments::CPF.valid?(record.cpf)
                record.errors[:cpf] << "CPF Inválido"
            end
            if record.fullname == ""
                record.errors[:fullname] << "O campo 'Nome completo' não pode ser nulo."
            end
            if record.fullname.length > 50
                record.errors[:fullname] << "O campo 'Nome completo' deve possuir menos que 51 caracteres."
            end
            if !record.fullname.match(/\A[[:alpha:][:blank:]]+\z/)
                record.errors[:fullname] << "O campo 'Nome completo' deve conter apenas letras e espaços."
            end
        elsif record.pf_pj == "PJ"
            if !BRDocuments::CNPJ.valid?(record.cnpj)
                record.errors[:cnpj] << "CNPJ Inválido"
            end
            if record.razaosocial == ""
                record.errors[:razaosocial] << "O campo 'Razão social' não pode ser nulo."
            end
            if record.cep == ""
                record.errors[:cep] << "O campo 'CEP' não pode ser nulo."
            end 
        end
        if !record.password.match(/(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*\W+).*$/)
            record.errors[:password] << "A senha de ve conter um caractere especial, uma letra maiúscula, uma letra minúscula e um número."
        end
        if !record.email.match(/\A[^@\s]+@youse.com.br/)
            record.errors[:email] << ": Deve ser no formato 'fulano@youse.com.br'."
        end
        if record.pf_pj == ""
            record.errors[:pf_pj] << "Selecione o tipo de pessoa"
        end
    end 
end 

