Class {
	#name : #TypShaPhaBehavior,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaBehavior class >> shadowedClass [
	^ Behavior class
]

{ #category : #shadow }
TypShaPhaBehavior >> mAllSubclasses: aLookup [
	<typShaMethod: 'allSubclasses'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType
				copyWithParameters: {Behavior typAsType})
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaBehavior >> mBasicNew: aLookup [
	<typShaMethod: 'basicNew'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			aLookup receiverType classDescription instanceSide typAsType typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaBehavior >> mBinary83: aLookup [
	<typShaMethod: '>>'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: CompiledMethod typAsType
		arguments: {Symbol typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaBehavior >> mCanUnderstand: aLookup [
	<typShaMethod: 'canUnderstand:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Symbol typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaBehavior >> mClassVarNames: aLookup [
	<typShaMethod: 'classVarNames'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Set typAsType copyWithParameters: {String typAsType})
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaBehavior >> mCompile: aLookup [
	<typShaMethod: 'compile:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Symbol typAsType
		arguments: {String typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaBehavior >> mCompiledMethodAt: aLookup [
	<typShaMethod: 'compiledMethodAt:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: CompiledMethod typAsType
		arguments: {Symbol typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaBehavior >> mIncludesBehavior: aLookup [
	<typShaMethod: 'includesBehavior:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Behavior typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaBehavior >> mIncludesSelector: aLookup [
	<typShaMethod: 'includesSelector:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Symbol typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaBehavior >> mInheritsFrom: aLookup [
	<typShaMethod: 'inheritsFrom:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {ClassDescription typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaBehavior >> mInstVarNames: aLookup [
	<typShaMethod: 'instVarNames'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType
				copyWithParameters: {String typAsType})
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaBehavior >> mIsAbstract: aLookup [
	<typShaMethod: 'isAbstract'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaBehavior >> mLookupSelector: aLookup [
	<typShaMethod: 'lookupSelector:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: CompiledMethod typAsType
		arguments: {Symbol typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaBehavior >> mMethodNamed: aLookup [
	<typShaMethod: 'methodNamed:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: CompiledMethod typAsType
		arguments: {Symbol typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaBehavior >> mMethods: aLookup [
	<typShaMethod: 'methods'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(Collection typAsType copyWithParameters: {CompiledMethod typAsType})
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaBehavior >> mName: aLookup [
	<typShaMethod: 'name'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: String typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaBehavior >> mNew: aLookup [
	<typShaMethod: 'new'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			aLookup receiverType classDescription instanceSide typAsType typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaBehavior >> mSelectors: aLookup [
	<typShaMethod: 'selectors'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Collection typAsType copyWithParameters: {Symbol typAsType})
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaBehavior >> mSuperclass: aLookup [
	<typShaMethod: 'superclass'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: ClassDescription typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaBehavior >> mWhichClassDefinesClassVar: aLookup [
	<typShaMethod: 'whichClassDefinesClassVar:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Class typAsType
		arguments: {String typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaBehavior >> mWhichClassDefinesInstVar: aLookup [
	<typShaMethod: 'whichClassDefinesInstVar:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: ClassDescription typAsType
		arguments: {String typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaBehavior >> mWithAllSuperclasses: aLookup [
	<typShaMethod: 'withAllSuperclasses'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType
				copyWithParameters: {ClassDescription typAsType})
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]
