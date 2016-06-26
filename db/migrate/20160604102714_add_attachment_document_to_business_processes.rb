class AddAttachmentDocumentToBusinessProcesses < ActiveRecord::Migration
  def self.up
    change_table :business_processes do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :business_processes, :document
  end
end
