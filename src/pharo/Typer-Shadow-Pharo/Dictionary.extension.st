Extension { #name : #Dictionary }

{ #category : #'*Typer-Shadow-Pharo' }
Dictionary >> typShaMethodAnyOne: aLookup [
	<typShaMethod: 'anyOne'>
	^ CompiledMethod typAsFunctionTypeWithResult: (aLookup receiver at: #A)
]

{ #category : #'*Typer-Shadow-Pharo' }
Dictionary >> typShaMethodAsOrderedDictionary: aLookup [
	<typShaMethod: 'asOrderedDictionary'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (OrderedDictionary typAsType
				withParameters: {aLookup receiver at: #B.
						aLookup receiver at: #A})
]

{ #category : #'*Typer-Shadow-Pharo' }
Dictionary >> typShaMethodAssociations: aLookup [
	<typShaMethod: 'associations'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Array typAsType
				withParameters: {Association typAsType
							withParameters: {aLookup receiver at: #B.
									aLookup receiver at: #A}})
]

{ #category : #'*Typer-Shadow-Pharo' }
Dictionary >> typShaMethodAssociationsDo: aLookup [
	<typShaMethod: 'associationsDo:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {BlockClosure
					typAsFunctionTypeWithResult: TypUnknownType instance
					arguments: {Association typAsType
								withParameters: {aLookup receiver at: #B.
										aLookup receiver at: #A}}}
]

{ #category : #'*Typer-Shadow-Pharo' }
Dictionary >> typShaMethodAt: aLookup [
	<typShaMethod: 'at:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup self at: #A)
		arguments: {aLookup self at: #B}
]

{ #category : #'*Typer-Shadow-Pharo' }
Dictionary >> typShaMethodAtIfAbsent: aLookup [
	<typShaMethod: 'at:ifAbsent:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: {aLookup receiver at: #A.
				aLookup arguments second result} typAsType
		arguments: {aLookup receiver at: #B.
				BlockClosure typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Dictionary >> typShaMethodAtIfAbsentPut: aLookup [
	<typShaMethod: 'at:ifAbsentPut:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver at: #A)
		arguments: {aLookup receiver at: #B.
				BlockClosure typAsFunctionTypeWithResult: (aLookup receiver at: #A)}
]

{ #category : #'*Typer-Shadow-Pharo' }
Dictionary >> typShaMethodAtIfPresentIfAbsent: aLookup [
	<typShaMethod: 'at:ifPresent:ifAbsent:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: {(aLookup arguments at: 2) result.
				(aLookup arguments at: 3) result} typAsType
		arguments: {aLookup receiver at: #B.
				BlockClosure
					typAsFunctionTypeWithResult: TypUnknownType instance
					arguments: {aLookup receiver at: #A}
					argumentsOptional: true
					signalsAlways: false.
				BlockClosure typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Dictionary >> typShaMethodAtPut: aLookup [
	<typShaMethod: 'at:put:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver at: #A)
		arguments: {aLookup receiver at: #B.
				aLookup receiver at: #A}
]

{ #category : #'*Typer-Shadow-Pharo' }
Dictionary >> typShaMethodBinary214: aLookup [
	<typShaMethod: ','>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver
				withParameters: {{aLookup receiver at: #B.
							(aLookup arguments at: 1) at: #B} typAsType.
						{aLookup receiver at: #A.
							(aLookup arguments at: 1) at: #A} typAsType})
		arguments: {Dictionary typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Dictionary >> typShaMethodCollect: aLookup [
	<typShaMethod: 'collect:'>
	| a r |
	a := aLookup arguments at: 1.
	r := (a isValue and: [ a value isString ])
			ifTrue: [ ((aLookup receiver at: #A) lookupMethod: a value asSymbol arguments: #())
					result ]
			ifFalse: [ a result ].
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup self
				withParameters: {aLookup receiver at: #B.
						r})
		arguments: {{Symbol typAsType.
					BlockClosure
						typAsFunctionTypeWithResult: TypUnknownType instance
						arguments: {aLookup receiver at: #A}} typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Dictionary >> typShaMethodIncludes: aLookup [
	<typShaMethod: 'includes:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {aLookup receiver at: #A}
]

{ #category : #'*Typer-Shadow-Pharo' }
Dictionary >> typShaMethodIncludesKey: aLookup [
	<typShaMethod: 'includesKey:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {aLookup receiver at: #B}
]

{ #category : #'*Typer-Shadow-Pharo' }
Dictionary >> typShaMethodKeys: aLookup [
	<typShaMethod: 'keys'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Collection typAsType withParameters: {aLookup receiver at: #B})
]

{ #category : #'*Typer-Shadow-Pharo' }
Dictionary >> typShaMethodKeysAndValuesDo: aLookup [
	<typShaMethod: 'keysAndValuesDo:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {BlockClosure
					typAsFunctionTypeWithResult: TypUnknownType instance
					arguments: {aLookup receiver at: #B.
							aLookup receiver at: #A}}
]

{ #category : #'*Typer-Shadow-Pharo' }
Dictionary >> typShaMethodRemoveKeyIfAbsent: aLookup [
	<typShaMethod: 'removeKey:ifAbsent:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: {aLookup receiver at: #A.
				aLookup arguments first result} typAsType
		arguments: {aLookup receiver at: #B.
				BlockClosure typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Dictionary >> typShaMethodValues: aLookup [
	<typShaMethod: 'values'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Collection typAsType withParameters: {aLookup self at: #A})
]

{ #category : #'*Typer-Shadow-Pharo' }
Dictionary class >> typShaType: aLookup [
	<typShaType>
	^ aLookup root classDescription
		typAsParametricTypeWithParameters: {#B -> #B typAsVariableType.
				#A -> #A typAsVariableType} asOrderedDictionary
]
