//  This file was automatically generated and should not be edited.

import Apollo

public final class AllTodoesQuery: GraphQLQuery {
  public static let operationString =
    "query AllTodoes {\n  allTodoes {\n    __typename\n    ...TodoDetails\n  }\n}"

  public static var requestString: String { return operationString.appending(TodoDetails.fragmentString) }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("allTodoes", type: .nonNull(.list(.nonNull(.object(AllTodo.selections))))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(allTodoes: [AllTodo]) {
      self.init(snapshot: ["__typename": "Query", "allTodoes": allTodoes.map { $0.snapshot }])
    }

    public var allTodoes: [AllTodo] {
      get {
        return (snapshot["allTodoes"] as! [Snapshot]).map { AllTodo(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "allTodoes")
      }
    }

    public struct AllTodo: GraphQLSelectionSet {
      public static let possibleTypes = ["Todo"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("text", type: .nonNull(.scalar(String.self))),
        GraphQLField("complete", type: .nonNull(.scalar(Bool.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, text: String, complete: Bool) {
        self.init(snapshot: ["__typename": "Todo", "id": id, "text": text, "complete": complete])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var text: String {
        get {
          return snapshot["text"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "text")
        }
      }

      public var complete: Bool {
        get {
          return snapshot["complete"]! as! Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "complete")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var todoDetails: TodoDetails {
          get {
            return TodoDetails(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }
    }
  }
}

public final class UpdateTodoMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdateTodo($id: ID!, $text: String, $complete: Boolean) {\n  updateTodo(id: $id, text: $text, complete: $complete) {\n    __typename\n    ...TodoDetails\n  }\n}"

  public static var requestString: String { return operationString.appending(TodoDetails.fragmentString) }

  public var id: GraphQLID
  public var text: String?
  public var complete: Bool?

  public init(id: GraphQLID, text: String? = nil, complete: Bool? = nil) {
    self.id = id
    self.text = text
    self.complete = complete
  }

  public var variables: GraphQLMap? {
    return ["id": id, "text": text, "complete": complete]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateTodo", arguments: ["id": GraphQLVariable("id"), "text": GraphQLVariable("text"), "complete": GraphQLVariable("complete")], type: .object(UpdateTodo.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updateTodo: UpdateTodo? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateTodo": updateTodo.flatMap { $0.snapshot }])
    }

    public var updateTodo: UpdateTodo? {
      get {
        return (snapshot["updateTodo"] as? Snapshot).flatMap { UpdateTodo(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updateTodo")
      }
    }

    public struct UpdateTodo: GraphQLSelectionSet {
      public static let possibleTypes = ["Todo"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("text", type: .nonNull(.scalar(String.self))),
        GraphQLField("complete", type: .nonNull(.scalar(Bool.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, text: String, complete: Bool) {
        self.init(snapshot: ["__typename": "Todo", "id": id, "text": text, "complete": complete])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var text: String {
        get {
          return snapshot["text"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "text")
        }
      }

      public var complete: Bool {
        get {
          return snapshot["complete"]! as! Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "complete")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var todoDetails: TodoDetails {
          get {
            return TodoDetails(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }
    }
  }
}

public final class DeleteTodoMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteTodo($id: ID!) {\n  deleteTodo(id: $id) {\n    __typename\n    ...TodoDetails\n  }\n}"

  public static var requestString: String { return operationString.appending(TodoDetails.fragmentString) }

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteTodo", arguments: ["id": GraphQLVariable("id")], type: .object(DeleteTodo.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteTodo: DeleteTodo? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteTodo": deleteTodo.flatMap { $0.snapshot }])
    }

    public var deleteTodo: DeleteTodo? {
      get {
        return (snapshot["deleteTodo"] as? Snapshot).flatMap { DeleteTodo(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deleteTodo")
      }
    }

    public struct DeleteTodo: GraphQLSelectionSet {
      public static let possibleTypes = ["Todo"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("text", type: .nonNull(.scalar(String.self))),
        GraphQLField("complete", type: .nonNull(.scalar(Bool.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, text: String, complete: Bool) {
        self.init(snapshot: ["__typename": "Todo", "id": id, "text": text, "complete": complete])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var text: String {
        get {
          return snapshot["text"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "text")
        }
      }

      public var complete: Bool {
        get {
          return snapshot["complete"]! as! Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "complete")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var todoDetails: TodoDetails {
          get {
            return TodoDetails(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }
    }
  }
}

public struct TodoDetails: GraphQLFragment {
  public static let fragmentString =
    "fragment TodoDetails on Todo {\n  __typename\n  id\n  text\n  complete\n}"

  public static let possibleTypes = ["Todo"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("text", type: .nonNull(.scalar(String.self))),
    GraphQLField("complete", type: .nonNull(.scalar(Bool.self))),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(id: GraphQLID, text: String, complete: Bool) {
    self.init(snapshot: ["__typename": "Todo", "id": id, "text": text, "complete": complete])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return snapshot["id"]! as! GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "id")
    }
  }

  public var text: String {
    get {
      return snapshot["text"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "text")
    }
  }

  public var complete: Bool {
    get {
      return snapshot["complete"]! as! Bool
    }
    set {
      snapshot.updateValue(newValue, forKey: "complete")
    }
  }
}