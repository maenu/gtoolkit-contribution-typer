Extension { #name : #BrTextCursorAttribute }

{ #category : #'*Typer-Shadow-Brick' }
BrTextCursorAttribute >> typShaMethodEnterAction: aLookup [
	<typShaMethod: 'enterAction:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {BlockClosure
					typAsFunctionTypeWithResult: TypUnknownType instance
					arguments: {BrTextEditor typAsType.
							BrTextEditorCursorAddedEvent typAsType}
					argumentsOptional: true}
]

{ #category : #'*Typer-Shadow-Brick' }
BrTextCursorAttribute >> typShaMethodLeaveAction: aLookup [
	<typShaMethod: 'leaveAction:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {BlockClosure
					typAsFunctionTypeWithResult: TypUnknownType instance
					arguments: {BrTextEditor typAsType.
							BrTextEditorCursorRemovedEvent typAsType}
					argumentsOptional: true}
]
