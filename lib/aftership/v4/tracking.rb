require File.dirname(__FILE__) + '/base'

module AfterShip
  module V4
    class Tracking < AfterShip::V4::Base

      #POST /trackings
      def self.create(tracking_number, params = {})
        if tracking_number.empty? || tracking_number.nil?
          raise ArgumentError.new('tracking_number is required.')
        else
          query_hash = {:tracking_number => tracking_number}
          query_hash.merge!(params)
          body = {:tracking => query_hash}
          new(:post, 'trackings', {}, body).call
        end
      end

      #POST /trackings/:slug/:tracking_number/retrack
      def self.retrack(slug, tracking_number, params = {})
        if slug.empty? || slug.nil? || tracking_number.empty? || tracking_number.nil?
          raise ArgumentError.new('slug and tracking_number are required.')
        end
        new(:post, "trackings/#{slug}/#{tracking_number}/retrack", params).call
      end

      #DELETE /trackings/:slug/:tracking_number
      def self.delete(slug, tracking_number, params = {})
        if slug.empty? || slug.nil? || tracking_number.empty? || tracking_number.nil?
          raise ArgumentError.new('slug and tracking_number are required.')
        end
        new(:delete, "trackings/#{slug}/#{tracking_number}", params).call
      end

      #DELETE /trackings/:id
      def self.delete_by_id(id)
        if id.empty? || id.nil?
          raise ArgumentError.new('id is required.')
        end
        new(:delete, "trackings/#{id}").call
      end

      #GET /trackings/:slug/:tracking_number
      def self.get(slug, tracking_number, params = {})
        if slug.empty? || slug.nil? || tracking_number.empty? || tracking_number.nil?
          raise ArgumentError.new('slug and tracking_number are required.')
        end
        new(:get, "trackings/#{slug}/#{tracking_number}", params).call
      end

      #GET /trackings/:id
      def self.get_by_id(id, params = {})
        if id.empty? || id.nil?
          raise ArgumentError.new('id is required.')
        end
        new(:get, "trackings/#{id}", params).call
      end

      #GET /trackings
      def self.get_all(params = {})
        new(:get, 'trackings', params).call
      end

      #GET /trackings/exports
      def self.export(params = {})
        new(:get, 'trackings/exports', params).call
      end

      #PUT /trackings/:slug/:tracking_number
      def self.update(slug, tracking_number, params = {})
        if slug.empty? || slug.nil? || tracking_number.empty? || tracking_number.nil?
          raise ArgumentError.new('slug and tracking_number are required.')
        end
        body = {:tracking => params}
        new(:put, "trackings/#{slug}/#{tracking_number}", {}, body).call
      end

      #PUT /trackings/:id
      def self.update_by_id(id, params = {})
        if id.empty? || id.nil?
          raise ArgumentError.new('id is required.')
        end
        body = {:tracking => params}
        new(:put, "trackings/#{id}", {}, body).call
      end

      #Deprecated
      #POST /trackings/:slug/:tracking_number/reactivate
      def self.reactivate(slug, tracking_number)
        raise StandardError.new('This method is deprecated, please use "retrack" instead')
      end
    end
  end
end
