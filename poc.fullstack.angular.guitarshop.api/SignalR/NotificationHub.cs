﻿using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.SignalR;
using poc.fullstack.angular.guitarshop.api.Extensions;
using System.Collections.Concurrent;

namespace poc.fullstack.angular.guitarshop.api.SignalR;

[Authorize]
public sealed class NotificationHub : Hub
{
    private static readonly ConcurrentDictionary<string, string> UserConnections = new();

    public override Task OnConnectedAsync()
    {
        var email = Context.User?.GetEmail();

        if (!string.IsNullOrEmpty(email))
            UserConnections[email] = Context.ConnectionId;

        return base.OnConnectedAsync();
    }

    public override Task OnDisconnectedAsync(Exception? exception)
    {
        var email = Context.User?.GetEmail();

        if (!string.IsNullOrEmpty(email))
            UserConnections.TryRemove(email, out _);

        return base.OnDisconnectedAsync(exception);
    }

    public static string? GetConnectionIdByEmail(string email)
    {
        UserConnections.TryGetValue(email, out var connectionId);

        return connectionId;
    }
}