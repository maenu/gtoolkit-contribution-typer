Extension { #name : #CompiledMethod }

{ #category : #'*Typer-GToolkit' }
CompiledMethod >> typGtElement [

	^ BlElement new
		  in: [ :e | 
			  | color |
			  TypInfSelf value: self methodClass typAsType during: [ 
					  color := self ast
						           typInfType;
						           typCheColor.
					  (self ast typCheHasUnknownArguments not and: [ 
						   self ast typCheHasUnknownResult not ])
						  ifTrue: [ e background: color ]
						  ifFalse: [ e background: color muchLighter ] ] ];
		  constraintsDo: [ :c | 
			  c horizontal exact: 16. "typCastAs BlLayoutCommonConstraintsAxis"
			  c vertical exact: 16 "typCastAs BlLayoutCommonConstraintsAxis" ];
		  aptitude: (BrGlamorousWithTooltipAptitude content: [ 
				   BrLabel new
					   look: BrGlamorousLabelAptitude;
					   padding: (BlInsets all: 5);
					   text: self selector;
					   yourself ]);
		  when: BlClickEvent do: [ :f | f target phlow spawnObject: self ];
		  yourself
]
