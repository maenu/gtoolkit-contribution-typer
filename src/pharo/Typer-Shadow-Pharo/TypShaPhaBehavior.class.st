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
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			SequenceableCollection typAsType
				copyWithParameters: {Behavior typAsType} ];
		yourself
]

{ #category : #shadow }
TypShaPhaBehavior >> mBasicNew: aLookup [ 
	<typShaMethod: 'basicNew'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			(a receiverType asCollection
				collect: [ :e | 
					e isUnknown
						ifTrue: [ e ]
						ifFalse: [ e classDescription instanceSide typAsType ] ])
				typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaBehavior >> mBinary83: aLookup [ 
	<typShaMethod: '>>'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Symbol typAsType ];
		resultType: [ :a :s :r | CompiledMethod typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaBehavior >> mCanUnderstand: aLookup [ 
	<typShaMethod: 'canUnderstand:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Symbol typAsType ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaBehavior >> mClassVarNames: aLookup [ 
	<typShaMethod: 'classVarNames'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType:
				[ :a :s :r | Set typAsType copyWithParameters: {String typAsType} ];
		yourself
]

{ #category : #shadow }
TypShaPhaBehavior >> mCompile: aLookup [ 
	<typShaMethod: 'compile:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | String typAsType ];
		resultType: [ :a :s :r | Symbol typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaBehavior >> mCompiledMethodAt: aLookup [ 
	<typShaMethod: 'compiledMethodAt:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Symbol typAsType ];
		resultType: [ :a :s :r | CompiledMethod typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaBehavior >> mIncludesBehavior: aLookup [ 
	<typShaMethod: 'includesBehavior:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Behavior typAsType ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaBehavior >> mIncludesSelector: aLookup [ 
	<typShaMethod: 'includesSelector:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Symbol typAsType ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaBehavior >> mInheritsFrom: aLookup [ 
	<typShaMethod: 'inheritsFrom:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | ClassDescription typAsType ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaBehavior >> mInstVarNames: aLookup [ 
	<typShaMethod: 'instVarNames'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			SequenceableCollection typAsType
				copyWithParameters: {String typAsType} ];
		yourself
]

{ #category : #shadow }
TypShaPhaBehavior >> mIsAbstract: aLookup [ 
	<typShaMethod: 'isAbstract'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaBehavior >> mLookupSelector: aLookup [ 
	<typShaMethod: 'lookupSelector:'>
	
	^ TypFunctionType new
		argumentTypes: [ Symbol typAsType ];
		resultType: [ CompiledMethod typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaBehavior >> mMethodNamed: aLookup [ 
	<typShaMethod: 'methodNamed:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Symbol typAsType ];
		resultType: [ :a :s :r | CompiledMethod typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaBehavior >> mMethods: aLookup [ 
	<typShaMethod: 'methods'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType:
				[ Collection typAsType copyWithParameters: {CompiledMethod typAsType} ];
		yourself
]

{ #category : #shadow }
TypShaPhaBehavior >> mName: aLookup [ 
	<typShaMethod: 'name'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | String typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaBehavior >> mNew: aLookup [ 
	<typShaMethod: 'new'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			(a receiverType asCollection
				collect: [ :e | 
					e isUnknown
						ifTrue: [ e ]
						ifFalse: [ e classDescription instanceSide typAsType ] ])
				typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaBehavior >> mSelectors: aLookup [ 
	<typShaMethod: 'selectors'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType:
				[ :a :s :r | Collection typAsType copyWithParameters: {Symbol typAsType} ];
		yourself
]

{ #category : #shadow }
TypShaPhaBehavior >> mSuperclass: aLookup [ 
	<typShaMethod: 'superclass'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | ClassDescription typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaBehavior >> mWhichClassDefinesClassVar: aLookup [ 
	<typShaMethod: 'whichClassDefinesClassVar:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | String typAsType ];
		resultType: [ :a :s :r | Class typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaBehavior >> mWhichClassDefinesInstVar: aLookup [ 
	<typShaMethod: 'whichClassDefinesInstVar:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | String typAsType ];
		resultType: [ :a :s :r | ClassDescription typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaBehavior >> mWithAllSuperclasses: aLookup [ 
	<typShaMethod: 'withAllSuperclasses'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			SequenceableCollection typAsType
				copyWithParameters: {ClassDescription typAsType} ];
		yourself
]
