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
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments:
			{(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments:
					{BrTextEditor typAsType.
					BrTextEditorCursorAddedEvent typAsType}
				argumentsOptional: true
				signalsAlways: false)}
]

{ #category : #shadow }
TypShaBrBrTextCursorAttribute >> mLeaveAction: aLookup [
	<typShaMethod: 'leaveAction:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments:
			{(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments:
					{BrTextEditor typAsType.
					BrTextEditorCursorRemovedEvent typAsType}
				argumentsOptional: true
				signalsAlways: false)}
]
