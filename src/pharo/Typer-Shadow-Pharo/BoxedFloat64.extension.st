Extension { #name : #BoxedFloat64 }

{ #category : #'*Typer-Shadow-Pharo' }
BoxedFloat64 >> typShaMetBinary1: aLookup [
	<typShaMethod: '+'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Float typAsType
		arguments: {Float typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
BoxedFloat64 >> typShaMetBinary2: aLookup [
	<typShaMethod: '-'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Float typAsType
		arguments: {Float typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
BoxedFloat64 >> typShaMetBinary3: aLookup [
	<typShaMethod: '<'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Float typAsType
		arguments: {Boolean typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
BoxedFloat64 >> typShaMetBinary4: aLookup [
	<typShaMethod: '>'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Float typAsType
		arguments: {Boolean typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
BoxedFloat64 >> typShaMetBinary5: aLookup [
	<typShaMethod: '='>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Float typAsType
		arguments: {Boolean typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
BoxedFloat64 >> typShaMetBinary6: aLookup [
	<typShaMethod: '*'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Float typAsType
		arguments: {Float typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
BoxedFloat64 >> typShaMetBinary7: aLookup [
	<typShaMethod: '/'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Float typAsType
		arguments: {Float typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
BoxedFloat64 >> typShaMetTruncated: aLookup [
	<typShaMethod: 'truncated'>
	^ CompiledMethod typAsFunctionTypeWithResult: SmallInteger typAsType
]
