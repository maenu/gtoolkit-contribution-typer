Extension { #name : #OrderedDictionary }

{ #category : #'*Typer-Shadow-Pharo' }
OrderedDictionary >> typShaMethodAnyOne: aLookup [
	<typShaMethod: 'anyOne'>
	^ CompiledMethod typAsFunctionTypeWithResult: (aLookup receiver at: #A)
]

{ #category : #'*Typer-Shadow-Pharo' }
OrderedDictionary >> typShaMethodAsOrderedDictionary: aLookup [
	<typShaMethod: 'asOrderedDictionary'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (OrderedDictionary typAsType
				withParameters: {aLookup receiver at: #B.
						aLookup receiver at: #A})
]

{ #category : #'*Typer-Shadow-Pharo' }
OrderedDictionary >> typShaMethodAssociations: aLookup [
	<typShaMethod: 'associations'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Array typAsType
				withParameters: {Association typAsType
							withParameters: {aLookup receiver at: #B.
									aLookup receiver at: #A}})
]

{ #category : #'*Typer-Shadow-Pharo' }
OrderedDictionary >> typShaMethodAssociationsDo: aLookup [
	<typShaMethod: 'associationsDo:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {BlockClosure
					typAsFunctionTypeWithResult: TypUnknownType instance
					arguments: {Association typAsType
								withParameters: {aLookup receiver at: #B.
										aLookup receiver at: #A}}}
]

{ #category : #'*Typer-Shadow-Pharo' }
OrderedDictionary >> typShaMethodAt: aLookup [
	<typShaMethod: 'at:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver at: #A)
		arguments: {aLookup receiver at: #B}
]

{ #category : #'*Typer-Shadow-Pharo' }
OrderedDictionary >> typShaMethodAtIfAbsentPut: aLookup [
	<typShaMethod: 'at:ifAbsentPut:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver at: #A)
		arguments: {aLookup receiver at: #B.
				BlockClosure typAsFunctionTypeWithResult: (aLookup receiver at: #A)}
]

{ #category : #'*Typer-Shadow-Pharo' }
OrderedDictionary >> typShaMethodAtIfPresentIfAbsent: aLookup [
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
OrderedDictionary >> typShaMethodAtPut: aLookup [
	<typShaMethod: 'at:put:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver at: #A)
		arguments: {aLookup receiver at: #B.
				aLookup receiver at: #A}
]

{ #category : #'*Typer-Shadow-Pharo' }
OrderedDictionary >> typShaMethodBinary276: aLookup [
	<typShaMethod: ','>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver
				withParameters: {{aLookup receiver at: #B.
							(aLookup arguments at: 1) at: #B} typAsType.
						{aLookup receiver at: #A.
							(aLookup arguments at: 1) at: #A} typAsType})
		arguments: {OrderedDictionary typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
OrderedDictionary >> typShaMethodCollect: aLookup [
	<typShaMethod: 'collect:'>
	| a r |
	a := aLookup arguments at: 1.
	r := (a isValue and: [ a value isString ])
			ifTrue: [ ((aLookup receiver at: #A) lookupMethod: a value asSymbol arguments: #())
					result ]
			ifFalse: [ a result ].
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup root receiver
				withParameters: {aLookup receiver at: #B.
						r})
		arguments: {{Symbol typAsType.
					BlockClosure
						typAsFunctionTypeWithResult: TypUnknownType instance
						arguments: {aLookup receiver at: #A}} typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
OrderedDictionary >> typShaMethodIncludes: aLookup [
	<typShaMethod: 'includes:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {aLookup receiver at: #A}
]

{ #category : #'*Typer-Shadow-Pharo' }
OrderedDictionary >> typShaMethodIncludesKey: aLookup [
	<typShaMethod: 'includesKey:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {aLookup receiver at: #B}
]

{ #category : #'*Typer-Shadow-Pharo' }
OrderedDictionary >> typShaMethodKeys: aLookup [
	<typShaMethod: 'keys'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Array typAsType withParameters: {aLookup receiver at: #B})
]

{ #category : #'*Typer-Shadow-Pharo' }
OrderedDictionary >> typShaMethodValues: aLookup [
	<typShaMethod: 'values'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Collection typAsType withParameters: {aLookup root receiver at: #A})
]

{ #category : #'*Typer-Shadow-Pharo' }
OrderedDictionary >> typShaResolve: aLookup [ 
	<typShaType>
	
	^ aLookup root classDescription
		typAsParametricTypeWithParameters:
			{(#B -> #B typAsVariableType).
			(#A -> #A typAsVariableType)} asOrderedDictionary
]
