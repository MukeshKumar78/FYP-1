
package com.campusme.society.event;

import org.hibernate.search.mapper.pojo.bridge.RoutingBridge;
import org.hibernate.search.mapper.pojo.bridge.binding.RoutingBindingContext;
import org.hibernate.search.mapper.pojo.bridge.mapping.programmatic.RoutingBinder;
import org.hibernate.search.mapper.pojo.bridge.runtime.RoutingBridgeRouteContext;
import org.hibernate.search.mapper.pojo.route.DocumentRoutes;

public class EventPublishedRoutingBinder implements RoutingBinder {
  @Override
  public void bind(RoutingBindingContext context) {
    context.dependencies()
        .use("published");

    context.bridge(
        Event.class,
        new Bridge());
  }

  public static class Bridge implements RoutingBridge<Event> {
    @Override
    public void route(DocumentRoutes routes, Object entityIdentifier, Event indexedEntity,
        RoutingBridgeRouteContext context) {
      if (indexedEntity.isPublished())
        routes.addRoute();
      else
        routes.notIndexed();
    }

    @Override
    public void previousRoutes(DocumentRoutes routes, Object entityIdentifier, Event indexedEntity,
        RoutingBridgeRouteContext context) {
      routes.addRoute();
    }
  }
}
