class CatRentalRequest < ApplicationRecord
    STATUS = ['PENDING', 'APPROVED', 'DENIED']
    validates :cat_id, :start_date, :end_date, :status, presence: true
    validates :status, inclusion: { in: STATUS,
        message: "%{status} is not valid"
    } 
    validate :does_not_overlap_approved_request

    belongs_to :cat, dependent: :destroy,
    foreign_key: :cat_id,
    class_name: :Cat

    def overlapping_requests
        CatRentalRequest.joins(:cat).where("cat_id = ?", cat_id).where.not("start_date > ?", end_date).where.not("end_date <= ?", start_date)
    end

    def overlapping_approved_requests 
        overlapping_requests.where('status = ?', 'APPROVED')
    end

    def does_not_overlap_approved_request
        if overlapping_approved_requests.exists? 
            self.errors[:overlapping_request] << "There's an overlapping request" 
        end
    end

end
