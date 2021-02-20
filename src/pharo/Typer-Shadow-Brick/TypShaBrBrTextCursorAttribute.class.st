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
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments:
					{BrTextEditor typAsType.
					BrTextEditorCursorAddedEvent typAsType}
				argumentsOptional: true
				signalsAlways: false ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaBrBrTextCursorAttribute >> ___leaveAction: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments:
					{BrTextEditor typAsType.
					BrTextEditorCursorRemovedEvent typAsType}
				argumentsOptional: true
				signalsAlways: false ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
