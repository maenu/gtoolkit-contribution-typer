Extension { #name : #Collection }

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodBinaryConcatenate: aLookup [
	<typShaMethod: ','>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup self
				withAt: #A
					put: {aLookup receiver at: #A.
							(aLookup arguments at: 1) at: #A} typAsType;
				yourself)
		arguments: {Collection typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodKeywordAdd: aLookup [
	<typShaMethod: 'add:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup arguments at: 1)
		arguments: {aLookup receiver at: #A}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodKeywordAddAll: aLookup [
	<typShaMethod: 'addAll:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup arguments at: 1)
		arguments: {Collection typAsType withParameters: {aLookup receiver at: #A}}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodKeywordAllSatisfy: aLookup [
	<typShaMethod: 'allSatisfy:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {{Symbol typAsType.
					BlockClosure
						typAsFunctionTypeWithResult: Boolean typAsType
						arguments: {aLookup receiver at: #A}} typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodKeywordAnySatisfy: aLookup [
	<typShaMethod: 'anySatisfy:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {{Symbol typAsType.
					BlockClosure
						typAsFunctionTypeWithResult: Boolean typAsType
						arguments: {aLookup receiver at: #A}} typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodKeywordAt: aLookup [
	<typShaMethod: 'at:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver at: #A)
		arguments: {Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodKeywordCopyWithout: aLookup [
	<typShaMethod: 'copyWithout:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {aLookup receiver at: #A}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodKeywordCopyWithoutAll: aLookup [
	<typShaMethod: 'copyWithoutAll:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {Collection typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodKeywordDetect: aLookup [
	<typShaMethod: 'detect:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver at: #A)
		arguments: {{Symbol typAsType.
					BlockClosure
						typAsFunctionTypeWithResult: Boolean typAsType
						arguments: {aLookup receiver at: #A}} typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodKeywordDetectIfFound: aLookup [
	<typShaMethod: 'detect:ifFound:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {{Symbol typAsType.
					BlockClosure
						typAsFunctionTypeWithResult: Boolean typAsType
						arguments: {aLookup receiver at: #A}} typAsType.
				{Symbol typAsType.
					BlockClosure
						typAsFunctionTypeWithResult: TypUnknownType instance
						arguments: {aLookup receiver at: #A}
						argumentsOptional: true} typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodKeywordDo: aLookup [
	<typShaMethod: 'do:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {{Symbol typAsType.
					BlockClosure
						typAsFunctionTypeWithResult: TypUnknownType instance
						arguments: {aLookup self at: #A}} typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodKeywordGtItemsFor: aLookup [
	<typShaMethod: 'gtItemsFor:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: GtPhlowView typAsType
		arguments: {GtPhlowView typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodKeywordIncludes: aLookup [
	<typShaMethod: 'includes:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {aLookup receiver at: #A}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodKeywordIncludesAll: aLookup [
	<typShaMethod: 'includesAll:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Collection typAsType withParameters: {aLookup receiver at: #A}}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodKeywordReject: aLookup [
	<typShaMethod: 'reject:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {{Symbol typAsType.
					BlockClosure
						typAsFunctionTypeWithResult: Boolean typAsType
						arguments: {aLookup receiver at: #A}} typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodKeywordRemove: aLookup [
	<typShaMethod: 'remove:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver at: #A)
		arguments: {aLookup receiver at: #A}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodKeywordSelect: aLookup [
	<typShaMethod: 'select:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {{Symbol typAsType.
					BlockClosure
						typAsFunctionTypeWithResult: Boolean typAsType
						arguments: {aLookup receiver at: #A}} typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection class >> typShaMethodKeywordWith: aLookup [
	<typShaMethod: 'with:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver classDescription instanceSide typAsType
				withParameters: {aLookup arguments at: 1})
		arguments: {TypUnknownType instance asNullable}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection class >> typShaMethodKeywordWithAll: aLookup [
	<typShaMethod: 'withAll:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver classDescription instanceSide typAsType
				withParameters: {(aLookup arguments at: 1) at: #A})
		arguments: {Collection typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection class >> typShaMethodKeywordWithWith: aLookup [
	<typShaMethod: 'with:with:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver classDescription instanceSide typAsType
				withParameters: {aLookup arguments typAsType})
		arguments: {TypUnknownType instance.
				TypUnknownType instance}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodUnaryAnyOne: aLookup [
	<typShaMethod: 'anyOne'>
	^ CompiledMethod typAsFunctionTypeWithResult: (aLookup receiver at: #A)
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodUnaryAsDictionary: aLookup [
	<typShaMethod: 'asDictionary'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Dictionary typAsType
				withParameters: {(aLookup receiver at: #A) at: #A.
						(aLookup receiver at: #A) at: #B})
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodUnaryAsIdentitySet: aLookup [
	<typShaMethod: 'asIdentitySet'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (IdentitySet typAsType withParameters: {aLookup receiver at: #A})
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodUnaryAsOrderedCollection: aLookup [
	<typShaMethod: 'asOrderedCollection'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (OrderedCollection typAsType withParameters: {aLookup receiver at: #A})
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodUnaryAsOrderedDictionary: aLookup [
	<typShaMethod: 'asOrderedDictionary'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (OrderedDictionary typAsType
				withParameters: {(aLookup receiver at: #A) at: #A.
						(aLookup receiver at: #A) at: #B})
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodUnaryAsSet: aLookup [
	<typShaMethod: 'asSet'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Set typAsType withParameters: {aLookup receiver at: #A})
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodUnaryIsEmpty: aLookup [
	<typShaMethod: 'isEmpty'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodUnaryIsNotEmpty: aLookup [
	<typShaMethod: 'isNotEmpty'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodUnaryMax: aLookup [
	<typShaMethod: 'max'>
	^ CompiledMethod typAsFunctionTypeWithResult: Number typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodUnarySize: aLookup [
	<typShaMethod: 'size'>
	^ super typShaMethodUnarySize: aLookup
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection class >> typShaType: aLookup [
	<typShaType>
	^ aLookup root classDescription
		typAsParametricTypeWithParameters: {#A -> #A typAsVariableType} asOrderedDictionary
]
