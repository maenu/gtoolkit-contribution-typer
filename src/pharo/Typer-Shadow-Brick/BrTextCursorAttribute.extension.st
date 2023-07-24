Extension { #name : #BrTextCursorAttribute }

{ #category : #'*Typer-Shadow-Brick' }
BrTextCursorAttribute >> typShaMethodEnterAction: aLookup [
	<typShaMethod: 'enterAction:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {BlockClosure
					typAsFunctionTypeWithResult: TypUnknownType instance
					arguments: {BrTextEditor typAsType.
							BrTextEditorCursorAddedEvent typAsType}
					argumentsOptional: true
					signalsAlways: false}
]

{ #category : #'*Typer-Shadow-Brick' }
BrTextCursorAttribute >> typShaMethodLeaveAction: aLookup [
	<typShaMethod: 'leaveAction:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {BlockClosure
					typAsFunctionTypeWithResult: TypUnknownType instance
					arguments: {BrTextEditor typAsType.
							BrTextEditorCursorRemovedEvent typAsType}
					argumentsOptional: true
					signalsAlways: false}
]
