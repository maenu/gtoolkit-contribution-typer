Class {
	#name : #TypShaBrBrTextCursorAttribute,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Brick'
}

{ #category : #'as yet unclassified' }
TypShaBrBrTextCursorAttribute class >> shadowedClass [
	^ BrTextCursorAttribute class
]

{ #category : #accessing }
TypShaBrBrTextCursorAttribute >> ___enterAction: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure
				typAsFunctionTypeWithArguments:
					{BrTextEditor typAsType.
					BrTextEditorCursorAddedEvent typAsType}
				result: TypUnknownType new
				argumentsOptional: true ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaBrBrTextCursorAttribute >> ___leaveAction: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure
				typAsFunctionTypeWithArguments:
					{BrTextEditor typAsType.
					BrTextEditorCursorRemovedEvent typAsType}
				result: TypUnknownType new
				argumentsOptional: true ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
