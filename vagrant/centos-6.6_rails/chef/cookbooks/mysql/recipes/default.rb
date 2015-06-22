%w[mysql mysql-devel mysql-server].each do |pkg|
    package pkg do
        action :install
    end
end

