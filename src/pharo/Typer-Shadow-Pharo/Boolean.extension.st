Extension { #name : #Boolean }

{ #category : #'*Typer-Shadow-Pharo' }
Boolean >> typShaMethodAnd: aLookup [
	<typShaMethod: 'and:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {{Boolean typAsType.
					BlockClosure typAsFunctionTypeWithResult: Boolean typAsType} typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Boolean >> typShaMethodIfFalse: aLookup [
	<typShaMethod: 'ifFalse:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup arguments at: 1) result asNullable
		arguments: {BlockClosure typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Boolean >> typShaMethodIfTrue: aLookup [
	<typShaMethod: 'ifTrue:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup arguments at: 1) result asNullable
		arguments: {BlockClosure typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Boolean >> typShaMethodIfTrueIfFalse: aLookup [
	<typShaMethod: 'ifTrue:ifFalse:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup arguments
				collect: [ :e | e isFunction ifTrue: [ e result ] ifFalse: [ e ] ])
				typAsType
		arguments: {BlockClosure typAsType.
				BlockClosure typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Boolean >> typShaMethodNot: aLookup [
	<typShaMethod: 'not'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Boolean >> typShaMethodOr: aLookup [
	<typShaMethod: 'or:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {{Boolean typAsType.
					BlockClosure typAsFunctionTypeWithResult: Boolean typAsType} typAsType}
]
