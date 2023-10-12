Extension { #name : #Dictionary }

{ #category : #'*Typer-Shadow-Pharo' }
Dictionary >> typShaMethodBinaryConcatenate: aLookup [
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
Dictionary >> typShaMethodKeywordAssociationsDo: aLookup [
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
Dictionary >> typShaMethodKeywordAt: aLookup [
	<typShaMethod: 'at:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup self at: #A)
		arguments: {aLookup self at: #B}
]

{ #category : #'*Typer-Shadow-Pharo' }
Dictionary >> typShaMethodKeywordAtIfAbsent: aLookup [
	<typShaMethod: 'at:ifAbsent:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: {aLookup receiver at: #A.
				aLookup arguments second result} typAsType
		arguments: {aLookup receiver at: #B.
				BlockClosure typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Dictionary >> typShaMethodKeywordAtIfAbsentPut: aLookup [
	<typShaMethod: 'at:ifAbsentPut:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver at: #A)
		arguments: {aLookup receiver at: #B.
				BlockClosure typAsFunctionTypeWithResult: (aLookup receiver at: #A)}
]

{ #category : #'*Typer-Shadow-Pharo' }
Dictionary >> typShaMethodKeywordAtPut: aLookup [
	<typShaMethod: 'at:put:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver at: #A)
		arguments: {aLookup receiver at: #B.
				aLookup receiver at: #A}
]

{ #category : #'*Typer-Shadow-Pharo' }
Dictionary >> typShaMethodKeywordIncludes: aLookup [
	<typShaMethod: 'includes:'>
	^ super typShaMethodKeywordIncludes: aLookup
]

{ #category : #'*Typer-Shadow-Pharo' }
Dictionary >> typShaMethodKeywordIncludesKey: aLookup [
	<typShaMethod: 'includesKey:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {aLookup receiver at: #B}
]

{ #category : #'*Typer-Shadow-Pharo' }
Dictionary >> typShaMethodKeywordKeysAndValuesDo: aLookup [
	<typShaMethod: 'keysAndValuesDo:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {BlockClosure
					typAsFunctionTypeWithResult: TypUnknownType instance
					arguments: {aLookup receiver at: #B.
							aLookup receiver at: #A}}
]

{ #category : #'*Typer-Shadow-Pharo' }
Dictionary >> typShaMethodKeywordRemoveKeyIfAbsent: aLookup [
	<typShaMethod: 'removeKey:ifAbsent:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: {aLookup receiver at: #A.
				aLookup arguments first result} typAsType
		arguments: {aLookup receiver at: #B.
				BlockClosure typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Dictionary >> typShaMethodUnaryAnyOne: aLookup [
	<typShaMethod: 'anyOne'>
	^ super typShaMethodUnaryAnyOne: aLookup
]

{ #category : #'*Typer-Shadow-Pharo' }
Dictionary >> typShaMethodUnaryAsOrderedDictionary: aLookup [
	<typShaMethod: 'asOrderedDictionary'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (OrderedDictionary typAsType
				withParameters: {aLookup receiver at: #B.
						aLookup receiver at: #A})
]

{ #category : #'*Typer-Shadow-Pharo' }
Dictionary >> typShaMethodUnaryAssociations: aLookup [
	<typShaMethod: 'associations'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Array typAsType
				withParameters: {Association typAsType
							withParameters: {aLookup receiver at: #B.
									aLookup receiver at: #A}})
]

{ #category : #'*Typer-Shadow-Pharo' }
Dictionary >> typShaMethodUnaryKeys: aLookup [
	<typShaMethod: 'keys'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Collection typAsType withParameters: {aLookup receiver at: #B})
]

{ #category : #'*Typer-Shadow-Pharo' }
Dictionary >> typShaMethodUnaryValues: aLookup [
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
