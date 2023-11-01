Extension { #name : #BrTextCursorAttribute }

{ #category : #'*Typer-Shadow-Brick' }
BrTextCursorAttribute >> typShaMethodKeywordEnterAction: aLookup root: anotherLookup [
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
BrTextCursorAttribute >> typShaMethodKeywordLeaveAction: aLookup root: anotherLookup [
	<typShaMethod: 'leaveAction:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {BlockClosure
					typAsFunctionTypeWithResult: TypUnknownType instance
					arguments: {BrTextEditor typAsType.
							BrTextEditorCursorRemovedEvent typAsType}
					argumentsOptional: true}
]
