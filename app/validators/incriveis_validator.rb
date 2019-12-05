class IncriveisValidator < ActiveModel::Validator
    def validate(record)
        if record.pf_pj == "PF"
            if !BRDocuments::CPF.valid?(record.cpf)
                record.errors[:cpf] << 'CPF Inválido'
            end
            if record.fullname == ""
                record.errors[:fullname] << 'O campo nome completo não pode ser nulo'
            end
            if record.fullname.length > 50
                record.errors[:fullname] << 'O campo nome completo deve possuir menos que 50 caracteres'
            end
            if !record.fullname.match(/\A[[:alpha:][:blank:]]+\z/)
                record.errors[:fullname] << 'O campo nome completo deve conter apenas letras e espaços'
            end
            if !record.password.match(/(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*\W+).*$/)
                record.errors[:password] << 'A senha de ve conter um caractere especial, uma letra maiúscula, uma letra minúscula e um número'
            end
        elsif record.pf_pj == "PJ"
            if !BRDocuments::CNPJ.valid?(record.cnpj)
                record.errors[:cnpj] << 'CNPJ Inválido'
            end
            if record.razaosocial == ""
                record.errors[:razaosocial] << 'O campo razao social não pode ser nulo'
            end
        end
    end 
end 

