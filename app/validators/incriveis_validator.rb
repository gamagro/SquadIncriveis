class IncriveisValidator < ActiveModel::Validator
    def validate(record)
        if record.pf_pj == "PF"
            if !BRDocuments::CPF.valid?(record.cpf)
                record.errors[:cpf] << 'CPF Inválido'
            end
        elsif record.pf_pj == "PJ"
            if !BRDocuments::CNPJ.valid?(record.cnpj)
                record.errors[:cnpj] << 'CNPJ Inválido'
            end
        end 
    end 
end 

