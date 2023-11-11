Extension { #name : #Collection }

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodBinaryConcatenate: aLookup root: anotherLookup [
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
Collection >> typShaMethodKeywordAdd: aLookup root: anotherLookup [
	<typShaMethod: 'add:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup arguments at: 1)
		arguments: {aLookup receiver at: #A}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodKeywordAddAll: aLookup root: anotherLookup [
	<typShaMethod: 'addAll:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup arguments at: 1)
		arguments: {Collection typAsType withParameters: {aLookup receiver at: #A}}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodKeywordAllSatisfy: aLookup root: anotherLookup [
	<typShaMethod: 'allSatisfy:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {{Symbol typAsType.
					BlockClosure
						typAsFunctionTypeWithResult: Boolean typAsType
						arguments: {aLookup receiver at: #A}} typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodKeywordAnySatisfy: aLookup root: anotherLookup [
	<typShaMethod: 'anySatisfy:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {{Symbol typAsType.
					BlockClosure
						typAsFunctionTypeWithResult: Boolean typAsType
						arguments: {aLookup receiver at: #A}} typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodKeywordAt: aLookup root: anotherLookup [
	<typShaMethod: 'at:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver at: #A)
		arguments: {Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodKeywordCopyWithout: aLookup root: anotherLookup [
	<typShaMethod: 'copyWithout:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {aLookup receiver at: #A}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodKeywordCopyWithoutAll: aLookup root: anotherLookup [
	<typShaMethod: 'copyWithoutAll:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {Collection typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodKeywordDetect: aLookup root: anotherLookup [
	<typShaMethod: 'detect:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver at: #A)
		arguments: {{Symbol typAsType.
					BlockClosure
						typAsFunctionTypeWithResult: Boolean typAsType
						arguments: {aLookup receiver at: #A}} typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodKeywordDetectIfFound: aLookup root: anotherLookup [
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
Collection >> typShaMethodKeywordDo: aLookup root: anotherLookup [
	<typShaMethod: 'do:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {{Symbol typAsType.
					BlockClosure
						typAsFunctionTypeWithResult: TypUnknownType instance
						arguments: {aLookup self at: #A}} typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodKeywordGtItemsFor: aLookup root: anotherLookup [
	<typShaMethod: 'gtItemsFor:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: GtPhlowView typAsType
		arguments: {GtPhlowView typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodKeywordIncludes: aLookup root: anotherLookup [
	<typShaMethod: 'includes:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {aLookup receiver at: #A}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodKeywordIncludesAll: aLookup root: anotherLookup [
	<typShaMethod: 'includesAll:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Collection typAsType withParameters: {aLookup receiver at: #A}}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodKeywordReject: aLookup root: anotherLookup [
	<typShaMethod: 'reject:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {{Symbol typAsType.
					BlockClosure
						typAsFunctionTypeWithResult: Boolean typAsType
						arguments: {aLookup receiver at: #A}} typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodKeywordRemove: aLookup root: anotherLookup [
	<typShaMethod: 'remove:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver at: #A)
		arguments: {aLookup receiver at: #A}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodKeywordSelect: aLookup root: anotherLookup [
	<typShaMethod: 'select:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {{Symbol typAsType.
					BlockClosure
						typAsFunctionTypeWithResult: Boolean typAsType
						arguments: {aLookup receiver at: #A}} typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection class >> typShaMethodKeywordWith: aLookup root: anotherLookup [
	<typShaMethod: 'with:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (anotherLookup receiver classDescription instanceSide typAsType
				withParameters: {anotherLookup arguments at: 1})
		arguments: {TypUnknownType instance asNullable}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection class >> typShaMethodKeywordWithAll: aLookup root: anotherLookup [
	<typShaMethod: 'withAll:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (anotherLookup receiver classDescription instanceSide typAsType
				withParameters: {(anotherLookup arguments at: 1) at: #A})
		arguments: {Collection typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection class >> typShaMethodKeywordWithWith: aLookup root: anotherLookup [
	<typShaMethod: 'with:with:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (anotherLookup receiver classDescription instanceSide typAsType
				withParameters: {anotherLookup arguments typAsType})
		arguments: {TypUnknownType instance.
				TypUnknownType instance}
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodUnaryAnyOne: aLookup root: anotherLookup [
	<typShaMethod: 'anyOne'>
	^ CompiledMethod typAsFunctionTypeWithResult: (aLookup receiver at: #A)
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodUnaryAsDictionary: aLookup root: anotherLookup [
	<typShaMethod: 'asDictionary'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Dictionary typAsType
				withParameters: {(aLookup receiver at: #A) at: #A.
						(aLookup receiver at: #A) at: #B})
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodUnaryAsIdentitySet: aLookup root: anotherLookup [
	<typShaMethod: 'asIdentitySet'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (IdentitySet typAsType withParameters: {aLookup receiver at: #A})
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodUnaryAsOrderedCollection: aLookup root: anotherLookup [
	<typShaMethod: 'asOrderedCollection'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (OrderedCollection typAsType withParameters: {aLookup receiver at: #A})
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodUnaryAsOrderedDictionary: aLookup root: anotherLookup [
	<typShaMethod: 'asOrderedDictionary'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (OrderedDictionary typAsType
				withParameters: {(aLookup receiver at: #A) at: #A.
						(aLookup receiver at: #A) at: #B})
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodUnaryAsSet: aLookup root: anotherLookup [
	<typShaMethod: 'asSet'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Set typAsType withParameters: {aLookup receiver at: #A})
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodUnaryIsEmpty: aLookup root: anotherLookup [
	<typShaMethod: 'isEmpty'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodUnaryIsNotEmpty: aLookup root: anotherLookup [
	<typShaMethod: 'isNotEmpty'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection >> typShaMethodUnaryMax: aLookup root: anotherLookup [
	<typShaMethod: 'max'>
	^ CompiledMethod typAsFunctionTypeWithResult: Number typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Collection class >> typShaType: aLookup root: anotherLookup [
	<typShaType>
	^ anotherLookup classDescription
		typAsParametricTypeWithParameters: {#A -> #A typAsVariableType}
]
