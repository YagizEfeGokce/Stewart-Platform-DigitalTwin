function data = syncBridge(mode, varargin)
%SYNCBRIDGE UDP socket wrapper for real-time actuator length sync.
%
%   mode = 'init'  — create persistent udpport (returns handle)
%   mode = 'tx'    — transmit 6x1 double vector (requires handle + data)
%   mode = 'rx'    — receive 6x1 double vector (requires handle)
%   mode = 'close' — delete handle
%
%   Usage:
%       u = syncBridge('init', '127.0.0.1', 25000);
%       syncBridge('tx', u, lengths);
%       lengths = syncBridge('rx', u);
%       syncBridge('close', u);

    persistent udpHandle;

    switch lower(mode)
        case 'init'
            ip   = varargin{1};
            port = varargin{2};
            udpHandle = udpport('datagram', 'IPAddr', ip, 'RemotePort', port);
            data = udpHandle;

        case 'tx'
            u      = varargin{1};
            values = varargin{2};
            if numel(values) ~= 6
                error('syncBridge:InvalidPayload', 'Payload must be 6x1 double.');
            end
            write(u, typecast(double(values), 'uint8'), 'uint8');
            data = [];

        case 'rx'
            u = varargin{1};
            packet = read(u, 1, 48);  % 6 doubles = 48 bytes
            data = typecast(uint8(packet.Data), 'double');
            data = data(:);

        case 'close'
            u = varargin{1};
            clear u;
            if isvalid(udpHandle)
                delete(udpHandle);
            end
            data = [];

        otherwise
            error('syncBridge:UnknownMode', 'Unknown mode: %s', mode);
    end
end
