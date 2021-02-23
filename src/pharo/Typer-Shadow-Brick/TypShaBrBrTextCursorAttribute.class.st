Class {
	#name : #TypShaBrBrTextCursorAttribute,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Brick'
}

{ #category : #'as yet unclassified' }
TypShaBrBrTextCursorAttribute class >> shadowedClass [
	^ BrTextCursorAttribute class
]

{ #category : #shadow }
TypShaBrBrTextCursorAttribute >> mEnterAction: aLookup [
	<typShaMethod: 'enterAction:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiverType
		arguments:
			{(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments:
					{BrTextEditor typAsType.
					BrTextEditorCursorAddedEvent typAsType}
				argumentsOptional: true
				signalsAlways: false)}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaBrBrTextCursorAttribute >> mLeaveAction: aLookup [
	<typShaMethod: 'leaveAction:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiverType
		arguments:
			{(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments:
					{BrTextEditor typAsType.
					BrTextEditorCursorRemovedEvent typAsType}
				argumentsOptional: true
				signalsAlways: false)}
		argumentsOptional: false
		signalsAlways: false
]
