Extension { #name : #OrderedDictionary }

{ #category : #'*Typer-Shadow-Pharo' }
OrderedDictionary >> typShaMethodBinaryConcatenate: aLookup root: anotherLookup [
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
OrderedDictionary >> typShaMethodKeywordAssociationsDo: aLookup root: anotherLookup [
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
OrderedDictionary >> typShaMethodKeywordAt: aLookup root: anotherLookup [
	<typShaMethod: 'at:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver at: #A)
		arguments: {aLookup receiver at: #B}
]

{ #category : #'*Typer-Shadow-Pharo' }
OrderedDictionary >> typShaMethodKeywordAtIfAbsentPut: aLookup root: anotherLookup [
	<typShaMethod: 'at:ifAbsentPut:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver at: #A)
		arguments: {aLookup receiver at: #B.
				BlockClosure typAsFunctionTypeWithResult: (aLookup receiver at: #A)}
]

{ #category : #'*Typer-Shadow-Pharo' }
OrderedDictionary >> typShaMethodKeywordAtPut: aLookup root: anotherLookup [
	<typShaMethod: 'at:put:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver at: #A)
		arguments: {aLookup receiver at: #B.
				aLookup receiver at: #A}
]

{ #category : #'*Typer-Shadow-Pharo' }
OrderedDictionary >> typShaMethodKeywordIncludesKey: aLookup root: anotherLookup [
	<typShaMethod: 'includesKey:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {aLookup receiver at: #B}
]

{ #category : #'*Typer-Shadow-Pharo' }
OrderedDictionary >> typShaMethodUnaryAsOrderedDictionary: aLookup root: anotherLookup [
	<typShaMethod: 'asOrderedDictionary'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (OrderedDictionary typAsType
				withParameters: {aLookup receiver at: #B.
						aLookup receiver at: #A})
]

{ #category : #'*Typer-Shadow-Pharo' }
OrderedDictionary >> typShaMethodUnaryAssociations: aLookup root: anotherLookup [
	<typShaMethod: 'associations'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Array typAsType
				withParameters: {Association typAsType
							withParameters: {aLookup receiver at: #B.
									aLookup receiver at: #A}})
]

{ #category : #'*Typer-Shadow-Pharo' }
OrderedDictionary >> typShaMethodUnaryKeys: aLookup root: anotherLookup [
	<typShaMethod: 'keys'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Array typAsType withParameters: {aLookup receiver at: #B})
]

{ #category : #'*Typer-Shadow-Pharo' }
OrderedDictionary >> typShaMethodUnaryValues: aLookup root: anotherLookup [
	<typShaMethod: 'values'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Collection typAsType withParameters: {aLookup self at: #A})
]

{ #category : #'*Typer-Shadow-Pharo' }
OrderedDictionary class >> typShaType: aLookup root: anotherLookup [
	<typShaType>
	^ anotherLookup classDescription
		typAsParametricTypeWithParameters: {#B -> #B typAsVariableType.
				#A -> #A typAsVariableType}
]
