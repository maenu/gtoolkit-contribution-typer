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
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure typAsType
				asFunctionType:
					{BrTextEditor typAsType.
					BrTextEditorCursorAddedEvent typAsType}
				result: TypUnknownType instance
				optionalParameters: true ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaBrBrTextCursorAttribute >> ___leaveAction: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure typAsType
				asFunctionType:
					{BrTextEditor typAsType.
					BrTextEditorCursorRemovedEvent typAsType}
				result: TypUnknownType instance
				optionalParameters: true ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
