Class {
	#name : #TypExamples,
	#superclass : #Object,
	#category : #'Typer-Core-Examples-OLD'
}

{ #category : #accessing }
TypExamples >> recursion [
	| x |
	x := [ x ].
	^ x
]

{ #category : #accessing }
TypExamples >> typeAllMethods [
	<gtExample>
	^ (Smalltalk globals allClassesAndTraits copyFrom: 1 to: 1)
		flatCollect: [ :e | 
			{e.
			e classSide}
				flatCollect: [ :f | 
					f methods
						collect: [ :g | 
							g methodClass -> g selector
								->
									[ g ast
										typTypeReset;
										typType ] timeToRun ] ] ]
]
